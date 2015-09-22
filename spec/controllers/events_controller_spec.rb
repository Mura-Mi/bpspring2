require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      skip 'now printing...'
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    before do
      @event = create(:event);
    end

    after do
      Event.destroy_all
    end

    it "returns http success when event exists" do
      get :show, id: 1 
      expect(response).to have_http_status(:success)
    end

    it "returns not_found when event does not exist" do
      Event.destroy_all
      get :show, id: 2
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      skip 'now printing...'
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
