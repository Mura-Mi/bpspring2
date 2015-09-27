class YearMonth

  attr_reader :year, :month

  def initialize(year, month)
    @firstDate = Date.new(year, month, 1)
    @nextFirst = @firstDate >> 1
    @year = @firstDate.year
    @month = @firstDate.month
  end

  def allDays()
    days = []
    for date in @firstDate..@nextFirst
      days << date if date != @nextFirst
    end
    days
  end

end
