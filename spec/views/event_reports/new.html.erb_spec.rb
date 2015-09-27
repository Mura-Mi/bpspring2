require 'rails_helper'

RSpec.describe "event_reports/new", type: :view do
  before(:each) do
    assign(:event_report, EventReport.new(
      :user => nil,
      :event => nil,
      :comment => "MyText"
    ))
  end

  it "renders new event_report form" do
    render

    assert_select "form[action=?][method=?]", event_reports_path, "post" do

      assert_select "input#event_report_user_id[name=?]", "event_report[user_id]"

      assert_select "input#event_report_event_id[name=?]", "event_report[event_id]"

      assert_select "textarea#event_report_comment[name=?]", "event_report[comment]"
    end
  end
end
