require 'rails_helper'

RSpec.describe Event, type: :model do
  context "lack name" do
    it "is invalid" do
      event = Event.create(abbreviation: 'hoge', event_date: Date.new);
      event.valid?
      expect(event.errors).to have(1).item
      expect(event.errors[:name]).to be_present
    end
  end

  context 'lack event date' do
    it 'is invalid' do
      event = Event.create(name: 'hogehoge', abbreviation: 'hoge');
      event.valid?
      expect(event.errors).to have(1).item
      expect(event.errors[:event_date]).to be_present
    end
  end

  context "abbreviation is longer than name" do
    it "is not valid" do
      event = Event.create(name: 'name', abbreviation: 'name' + 'a', event_date: Date.new)
      event.valid?
      expect(event.errors).to have(1).item
      expect(event.errors[:abbreviation]).to be_present
    end
  end

  context "abbreviation is name" do
    it "is valid" do
      event = Event.create(name: 'hogehoge', abbreviation: 'hogehoge', event_date: Date.new)
      event.valid?
      expect(event.errors).to be_empty
    end
  end

end
