require 'rails_helper'

RSpec.describe EventPhoto, type: :model do
  let(:dummy_image) { File.open(File.join(Rails.root, 'app/assets/images/no_image.png')) }

  describe "validation" do

    it "accepts 50 chars in title" do
      photo = EventPhoto.new(photo: dummy_image, title: 'a' * 50)
      photo.valid?
      expect(photo.errors).to be_empty
    end

    it "does not accept 51 chars in title" do
      photo = EventPhoto.new(photo: dummy_image, title: 'b' * 51)
      photo.valid?
      expect(photo.errors).not_to be_empty
      expect(photo.errors[:title]).to be_present
    end

    it "accepts 600 chars in comment" do
      photo = EventPhoto.new(photo: dummy_image, comment: 'a' * 600)
      photo.valid?
      expect(photo.errors).to be_empty
    end

    it "does not accept 601 chars in comment" do
      photo = EventPhoto.new(photo: dummy_image, comment: 'b' * 601)
      photo.valid?
      expect(photo.errors).not_to be_empty
      expect(photo.errors[:comment]).to be_present
    end

    it "accepts empty title and comment" do
      photo = EventPhoto.new(photo: dummy_image);
      photo.valid?
      expect(photo.errors).to be_empty
    end

    it "does not accept empty photo title" do
      photo = EventPhoto.new(title: 'mikami', comment: 'kakkoii!');
      photo.valid?
      expect(photo.errors).not_to be_empty
      expect(photo.errors[:photo]).to be_present
    end

  end

  describe "interst" do
    before do
      @p = create(:event_photo, photo: dummy_image)

      @user1 = create(:user)
      Interest.new(user: @user1, to_id: @p.id, to_type: 'EventPhoto', interest_type: 'hit').save

      @user2 = create(:user)
      Interest.new(user: @user2, to_id: @p.id, to_type: 'EventPhoto', interest_type: 'hit').save

      @user3 = create(:user)
      Interest.new(user: @user3, to_id: @p.id, to_type: 'EventPhoto', interest_type: 'homerun').save

      Interest.new(user: @user3, to_id: @p.id + 1, to_type: 'EventPhoto', interest_type: 'homerun').save
    end

    it "counts interested users" do
      interested = @p.interested_people
      expect(interested).not_to be_nil

      expect(interested).to have_key('hit')
      expect(interested).to have_key('homerun')
      expect(interested['hit']).to include @user1.name
      expect(interested['hit']).to include @user2.name
      expect(interested['homerun']).to include @user3.name
    end

  end
end
