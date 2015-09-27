require 'rails_helper'

RSpec.describe "event_reports/show", type: :view do
  before(:each) do
    @event_report = assign(:event_report, EventReport.create!(
      :user => nil,
      :event => nil,
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
