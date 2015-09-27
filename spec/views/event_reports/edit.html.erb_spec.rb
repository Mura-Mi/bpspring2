require 'rails_helper'

RSpec.describe "event_reports/edit", type: :view do
  before(:each) do
    @event_report = assign(:event_report, EventReport.create!(
      :user => nil,
      :event => nil,
      :comment => "MyText"
    ))
  end

  it "renders the edit event_report form" do
    render

    assert_select "form[action=?][method=?]", event_report_path(@event_report), "post" do

      assert_select "input#event_report_user_id[name=?]", "event_report[user_id]"

      assert_select "input#event_report_event_id[name=?]", "event_report[event_id]"

      assert_select "textarea#event_report_comment[name=?]", "event_report[comment]"
    end
  end
end
