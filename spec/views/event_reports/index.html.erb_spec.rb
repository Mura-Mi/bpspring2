require 'rails_helper'

RSpec.describe "event_reports/index", type: :view do
  before(:each) do
    assign(:event_reports, [
      EventReport.create!(
        :user => nil,
        :event => nil,
        :comment => "MyText"
      ),
      EventReport.create!(
        :user => nil,
        :event => nil,
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of event_reports" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 4
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
