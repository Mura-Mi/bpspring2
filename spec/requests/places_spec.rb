require 'rails_helper'

RSpec.describe "Places", type: :request do
  describe "GET /places" do
    it "works! (now write some real specs)" do
      get places_path
      expect(response).to have_http_status(200)
    end

    it "works for getting new registration page" do
      get new_place_path
      expect(response).to have_http_status(200)
    end
  end
end
