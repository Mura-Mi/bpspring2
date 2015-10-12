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

  describe "scope" do
    describe "held_in" do
      it "contains event held in given place" do
        event = create(:event)
        scoped = Event.held_in(event.place.id)

        expect(scoped).to have(1).item
        expect(scoped).to include(event)
      end

      it "does not contains event not held in given place" do
        event = create(:event)
        scoped = Event.held_in(create(:place).id)

        expect(scoped).to be_empty
      end
    end
  end

  describe "oneline_info" do
    it "shows event name and date" do
      event = Event.new(name: 'My Forgettable Event', event_date: Date.new(2013, 4, 30))
      expect(event.oneline_info).to eq("My Forgettable Event (30 April, 2013)")
    end
  end

end
