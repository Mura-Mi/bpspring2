require 'rails_helper'

RSpec.describe "places/show", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!({ name: "Tokyo Cul Cul" }))
  end

  it "Title is rendered" do
    render
    expect(response.body).to match /Tokyo Cul Cul/im
  end
end
