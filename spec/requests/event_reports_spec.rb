require 'rails_helper'

RSpec.describe "EventReports", type: :request do
  describe "GET /event_reports" do
    it "works! (now write some real specs)" do
      get event_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
