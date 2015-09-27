require 'calendar/year_month'
require 'spec_helper'

RSpec.describe YearMonth, type: :model do
  it "creates new month" do
    month = YearMonth.new(2014, 8)
    expect(month).not_to be_nil
  end

  it "raises error when 13 is given for month" do
    expect{ YearMonth.new(2014, 13) }.to raise_error ArgumentError
  end

  it "returns all days in month" do
    ym = YearMonth.new(2014, 8)
    days = ym.days

    expect(days).to have(31).items
    for d in 1..31
      expect(days).to include Date.new(2014, 8, d)
    end
  end

  it "will be formatted" do
    expect(YearMonth.new(2014, 8).format).to eq('August, 2014')
  end

  it "will be formatted in yyyyMM" do
    expect(YearMonth.new(2014, 8).serialize).to eq('201408')
  end

  it "resolves next month" do
    expect(YearMonth.new(2014, 12).next.serialize).to eq('201501')
  end

  it "resolves previous month" do
    expect(YearMonth.new(2014, 1).previous.serialize).to eq('201312')
  end
end
