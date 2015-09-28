require 'rails_helper'

RSpec.describe "event_reports/show", type: :view do
  before(:each) do
    User.destroy_all
    Event.destroy_all
    @event_report = assign(:event_report, EventReport.create!(
      :user => create(:user),
      :event => create(:event),
      :comment => "MyText"
    ))
  end

  after do
    User.destroy_all
    Event.destroy_all
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
