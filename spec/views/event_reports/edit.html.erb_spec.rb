require 'rails_helper'

RSpec.describe "event_reports/edit", type: :view do
  before(:each) do
    User.destroy_all
    Event.destroy_all
    @event = create(:event)
    @event_report = assign(:event_report, create(:event_report))
  end

  after do
    User.destroy_all
    Event.destroy_all
  end

  it "renders the edit event_report form" do
    render

    assert_select "form[action=?][method=?]", event_report_path(@event_report), "post" do

      assert_select "textarea#event_report_comment[name=?]", "event_report[comment]"
    end
  end
end
