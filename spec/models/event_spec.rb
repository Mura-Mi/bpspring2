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

    describe "recent" do
      after do
        Event.destroy_all
        Place.destroy_all
      end

      it "contains latest events" do
        place1 = create(:place)
        event0 = create(:event, event_date: Date.today,     place: place1)
        event1 = create(:event, event_date: Date.today - 1, place: place1)
        event2 = create(:event, event_date: Date.today - 2, place: place1)
        event3 = create(:event, event_date: Date.today - 3, place: place1)
        event4 = create(:event, event_date: Date.today - 4, place: place1)

        place2 = create(:place)
        event5 = create(:event, event_date: Date.today - 1, place: place2)
        event6 = create(:event, event_date: Date.today - 2, place: place2)
        event7 = create(:event, event_date: Date.today - 3, place: place2)
        event8 = create(:event, event_date: Date.today - 4, place: place2)

        events = Event.held_in(place1.id).recent(3)

        expect(events).to have(3).items
        expect(events).to include(event1, event2, event3)
        expect(events).not_to include(event0, event4, event5, event6, event7, event8)
      end

      it "contains all events if not enough events exists" do
        place1 = create(:place)
        event0 = create(:event, event_date: Date.today,     place: place1)
        event1 = create(:event, event_date: Date.today - 1, place: place1)
        event2 = create(:event, event_date: Date.today - 2, place: place1)

        place2 = create(:place)
        event3 = create(:event, event_date: Date.today - 1, place: place2)
        event4 = create(:event, event_date: Date.today - 2, place: place2)

        events = Event.held_in(place1.id).recent(3)

        expect(events).to have(2).items
        expect(events).to include(event1, event2)
        expect(events).not_to include(event3, event4)
      end

    end

    describe "upcoming" do
      after do
        Event.destroy_all
        Place.destroy_all
      end

      it "contains upcoming" do
        event0 = create(:event, event_date: Date.today - 1)
        event1 = create(:event, event_date: Date.today)
        event2 = create(:event, event_date: Date.today + 1)
        event3 = create(:event, event_date: Date.today + 2)
        event4 = create(:event, event_date: Date.today + 3)

        events = Event.upcoming(3)

        expect(events).to have(3).items
        expect(events).to include(event1, event2, event3)
        expect(events).not_to include(event0, event4)
      end

      it "contains all if not enough events exists" do
        event0 = create(:event, event_date: Date.today - 1)
        event1 = create(:event, event_date: Date.today)
        event2 = create(:event, event_date: Date.today + 1)

        events = Event.upcoming(5)

        expect(events).to have(2).items
        expect(events).to include(event1, event2)
        expect(events).not_to include(event0)
      end
    end

  end

end
