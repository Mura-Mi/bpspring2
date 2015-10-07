require 'rails_helper'

RSpec.describe EventPhoto, type: :model do
  describe "validation" do
    it "accepts 50 chars in title" do
      photo = EventPhoto.new(photo: 'mikami.jpg', title: 'a' * 50)
      photo.valid?
      expect(photo.errors).to be_empty
    end

    it "does not accept 51 chars in title" do
      photo = EventPhoto.new(photo: 'mikami.jpg', title: 'b' * 51)
      photo.valid?
      expect(photo.errors).not_to be_empty
      expect(photo.errors[:title]).to be_present
    end

    it "accepts 600 chars in comment" do
      photo = EventPhoto.new(photo: 'mikami.jpg', comment: 'a' * 600)
      photo.valid?
      expect(photo.errors).to be_empty
    end

    it "does not accept 601 chars in comment" do
      photo = EventPhoto.new(photo: 'mikami.jpg', comment: 'b' * 601)
      photo.valid?
      expect(photo.errors).not_to be_empty
      expect(photo.errors[:comment]).to be_present
    end

    it "accepts empty title and comment" do
      photo = EventPhoto.new(photo: 'mikami.jpg');
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
end
