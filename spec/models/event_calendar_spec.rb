require 'rails_helper'
require 'date'

RSpec.describe EventCalendar, type: :model do

  it "gathers events by week and day" do
    # 2014/8/9 is Saturday
    event1 = Event.new(name: "first", event_date: Date.new(2014, 8, 9))
    event2 = Event.new(name: "second", event_date: Date.new(2014, 8, 10))
    event3 = Event.new(name: "third", event_date: Date.new(2014, 8, 9))
    event4 = Event.new(name: "third", event_date: Date.new(2014, 8, 12))

    cal = EventCalendar.new([event2, event1, event3, event4])

    expect(cal.weeks).to have(2).items

    expect(cal.weeks[0].eventsMap).to have(2).items
    expect(cal.weeks[0].eventsMap.keys).to include DayOfWeek::SATURDAY
    expect(cal.weeks[0].eventsMap[DayOfWeek::SATURDAY]).to have(2).items
    expect(cal.weeks[0].eventsMap.keys).to include DayOfWeek::SUNDAY

    expect(cal.weeks[1].eventsMap).to have(1).item
    expect(cal.weeks[1].eventsMap.keys).to include DayOfWeek::TUESDAY
  end
end
