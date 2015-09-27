# ===Event Calendar class
# A Calendar model consists Events.
# Each weeks begin from Monday

require 'date'
require 'calendar/day_of_week'

class EventCalendar
  attr_reader :weeks

  def initialize(yearMonth, events)
    byDay = events.select{ |e|
      yearMonth.days.include? e.event_date
    }.group_by do |e|
      e.event_date
    end

    @weeks = [];
    yearMonth.days.each do |day|
      if day.monday? || weeks.empty?
        weeks << EventWeek.new(day)
      else
        weeks.last.add_day day
      end
    end

    @weeks.each do |week|
      week.dates.values.each do |day|
        if byDay.key? day
          byDay[day].each {|e| week.add_event e}
        end
      end
    end

  end
end

class EventWeek

  attr_reader :eventsMap, :dates

  def initialize(date, events = nil)
    dayOfWeek = DayOfWeek.from_date(date)
    # @dates = {dayOfWeek: date}
    @dates = {}
    @dates.store(dayOfWeek, date)

    @eventsMap = {}

    if events != nil
      events.each do |event|
        add_event event
      end
    end
  end

  def add_day(date)
    dayOfWeek = DayOfWeek.from_date(date)
    @dates.store(dayOfWeek, date)
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
    if @eventsMap.empty?
      DayOfWeek::MONDAY
    else
      @eventsMap.keys.max
    end
  end
end

class EventDay
  attr_reader :events, :date

  def initialize(date, events)
    @events = events
    @date = date
  end

end
