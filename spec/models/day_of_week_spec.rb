require 'event_calendar'
require 'spec_helper'

RSpec.describe DayOfWeek, type: :model do
  it "is Saturday on 2014/8/9" do
    dow = DayOfWeek.from_date(Date.new(2014, 8, 9))
    expect(dow).to eq(DayOfWeek::SATURDAY)
  end

  it "is Sunday on 2014/8/10" do
    dow = DayOfWeek.from_date Date.new(2014, 8, 10)
    expect(dow).to eq(DayOfWeek::SUNDAY)
  end
end
