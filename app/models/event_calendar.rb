# ===Event Calendar class
# A Calendar model consists Events.
# Each weeks begin from Monday

require 'date'
require 'calendar/day_of_week'

class EventCalendar
  attr_reader :weeks

  def initialize(events)
    byDay = events.group_by do |e|
      e.event_date
    end

    @weeks = [];
    byDay.sort.each do |kv|
      dayOfWeek = DayOfWeek.from_date kv[0]

      if @weeks.empty?
        @weeks << EventWeek.new(kv[1])
      elsif @weeks.last.last_day_of_week > dayOfWeek
        @weeks << EventWeek.new(kv[1])
      else
        kv[1].each do |event|
          @weeks.last.add_event event
        end
      end

    end
  end
end

class EventWeek
  include ActiveModel::Conversion

  attr_reader :eventsMap

  def initialize(events = nil)
    @dates = {}
    @eventsMap = {}

    if events != nil
      events.each do |event|
        add_event event
      end
    end
  end

  def add_event(event)
    dayOfWeek = DayOfWeek.from_date(event.event_date)

    @dates.store(dayOfWeek, event.event_date)

    if @eventsMap.key?(dayOfWeek)
      @eventsMap[dayOfWeek] << event
    else
      @eventsMap.store(dayOfWeek, [event])
    end
  end

  def day_for(dayOfWeek)
    EventDay.new(@dates[dayOfWeek], @eventsMap[dayOfWeek])
  end

  def last_day_of_week
    @eventsMap.keys.max
  end
end

class EventDay
  attr_reader :events, :date

  def initialize(date, events)
    @events = events
    @date = date
  end

end
