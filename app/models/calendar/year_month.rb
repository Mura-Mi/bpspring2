class YearMonth

  attr_reader :year, :month, :days

  def initialize(year, month)
    @firstDate = Date.new(year, month, 1)
    @nextFirst = @firstDate >> 1
    @year = @firstDate.year
    @month = @firstDate.month

    @days = []
    for date in @firstDate..@nextFirst
      @days << date if date != @nextFirst
    end
    @days
  end

  public
  def format
    Date.new(@year, @month, 1).strftime('%B, %Y')
  end

  def serialize
    @year.to_s << @month.to_s.rjust(2, '0')
  end

  def previous
    prev = @firstDate << 1
    YearMonth.new(prev.year, prev.month)
  end

  def next
    YearMonth.new(@nextFirst.year, @nextFirst.month)
  end


  class << YearMonth
    def today
      t = Date.today
      YearMonth.new(t.year, t.month)
    end
  end

end
