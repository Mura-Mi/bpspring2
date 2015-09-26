# ===Event Calendar class
# A Calendar model consists Events.
# Each weeks begin from Monday

require 'date'

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
  attr_reader :eventsMap

  def initialize(events = nil)
    @eventsMap = {}

    if events != nil
      events.each do |event|
        add_event event
      end
    end
  end

  def add_event(event)
    dayOfWeek = DayOfWeek.from_date(event.event_date)
    if @eventsMap.key?(dayOfWeek)
      @eventsMap[dayOfWeek] << event
    else
      @eventsMap.store(dayOfWeek, [event])
    end
  end

  def last_day_of_week
    @eventsMap.keys.max
  end

end

module DayOfWeek
  MONDAY = 1
  TUESDAY = 2
  WEDNESDAY = 3
  THURSDAY = 4
  FRIDAY = 5
  SATURDAY = 6
  SUNDAY = 7

  def from_date(date)
    case date.wday
    when 0
      SUNDAY
    when 1
      MONDAY
    when 2
      TUESDAY
    when 3
      WEDNESDAY
    when 4
      THURSDAY
    when 5
    else
      SATURDAY
    end
  end

  module_function :from_date
end
