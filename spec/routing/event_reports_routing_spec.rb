require "rails_helper"

RSpec.describe EventReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_reports").to route_to("event_reports#index")
    end

    it "routes to #new" do
      expect(:get => "/event_reports/new").to route_to("event_reports#new")
    end

    it "routes to #show" do
      expect(:get => "/event_reports/1").to route_to("event_reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_reports/1/edit").to route_to("event_reports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_reports").to route_to("event_reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_reports/1").to route_to("event_reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_reports/1").to route_to("event_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_reports/1").to route_to("event_reports#destroy", :id => "1")
    end

  end
end
