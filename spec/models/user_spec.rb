require 'rails_helper'

RSpec.describe User, type: :model do
  context "without name" do
    it "is invalid" do
      user = User.new(email: 'example@example.com', password: 'hogehoge')
      user.valid?
      expect(user.errors).to have(1).item
      expect(user.errors[:name]).to be_present
    end
  end

  context "without password" do
    it "is invalid without SNS profile" do
      single_user = User.new(name: 'hoge', email: 'example@example.com')
      expect(single_user.valid?).to be_falsey
      expect(single_user.errors[:password]).to be_present
    end

    it "is valid with SNS profile" do |member|
      twitter_user = User.new(name: 'hoge', email: 'example@example.com')
      twitter_user.sns_profile.push(SnsProfile.new)
      expect(twitter_user.valid?).to be_truthy
      expect(twitter_user.errors).to be_empty
    end
  end

  context "duplicate email" do
    it 'is invalid' do
      user1 = User.new(name: 'Hoge', email: 'example1@example.com', password: 'hogehoge')
      user2 = User.new(name: 'Fuga', email: 'example1@example.com', password: 'hogehoge')
      user1.valid?
      expect(user1.errors).to be_empty
      user1.save

      user2.valid?
      expect(user2.errors).to have(1).item
      expect(user2.errors[:email]).to have(1).item
    end

    it 'allows empty email when signed up with OAuth' do
      user1 = User.new(name: 'Hoge', password: 'hogehoge')
      user1.sns_profile.push(SnsProfile.new)
      user1.valid?
      expect(user1.errors).to be_empty
      user1.save!

      user2 = User.new(name: 'Fuga', password: 'fugafuga')
      user2.sns_profile.push(SnsProfile.new)
      user2.valid?
      expect(user2.errors).to be_empty
    end
  end

  describe "posted_report_count" do
    let(:user) { create(:user) }
    context "new user" do
      it "returns 0" do
        expect(user.posted_report_count).to eq 0
      end
    end

    context "user with 3 event reports" do
      it "returns 3" do
        3.times do
          create(:event_report, user: user)
        end

        expect(user.posted_report_count).to eq 3
      end
    end

  end

end
