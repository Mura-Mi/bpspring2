require 'rails_helper'

RSpec.describe Event, type: :model do
  context "abbreviation is longer than name" do
    it "is not valid" do
      event = Event.create(name: 'name', abbreviation: 'name' + 'a')
      event.valid?
      expect(event.errors).not_to be_empty
      expect(event.errors[:abbreviation]).to be_present
    end
  end

  context "abbreviation is name" do
    it "is valid" do
      event = Event.create(name: 'hogehoge', abbreviation: 'hogehoge')
      event.valid?
      expect(event.errors).to be_empty
    end
  end

end
