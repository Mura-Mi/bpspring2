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



end
