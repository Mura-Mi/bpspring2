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

  def values
    [MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY]
  end

  module_function :from_date, :values
end
