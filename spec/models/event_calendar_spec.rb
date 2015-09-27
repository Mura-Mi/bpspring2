require 'rails_helper'
require 'date'
require 'calendar/year_month'

RSpec.describe EventCalendar, type: :model do

  it "gathers events by week and day" do
    # 2014/8/9 is Saturday
    event1 = Event.new(name: "first", event_date: Date.new(2014, 8, 9))
    event2 = Event.new(name: "second", event_date: Date.new(2014, 8, 10))
    event3 = Event.new(name: "third", event_date: Date.new(2014, 8, 9))
    event4 = Event.new(name: "third", event_date: Date.new(2014, 8, 12))

    cal = EventCalendar.new(YearMonth.new(2014, 8), [event2, event1, event3, event4])

    expect(cal.weeks).to have(5).items

    expect(cal.weeks[1].eventsMap).to have(2).items
    expect(cal.weeks[1].eventsMap.keys).to include DayOfWeek::SATURDAY
    expect(cal.weeks[1].eventsMap[DayOfWeek::SATURDAY]).to have(2).items
    expect(cal.weeks[1].eventsMap.keys).to include DayOfWeek::SUNDAY

    expect(cal.weeks[1].dates).to have(7).items
    for d in DayOfWeek.values
      expect(cal.weeks[1].dates.keys).to include d
    end

    expect(cal.weeks[2].eventsMap).to have(1).item
    expect(cal.weeks[2].eventsMap.keys).to include DayOfWeek::TUESDAY
  end
end
