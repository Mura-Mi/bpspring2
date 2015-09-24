require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    login_user
    Event.destroy_all
    @event = create(:event);
  end

  after do
    Event.destroy_all
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success when event exists" do
      get :edit, id: @event.id
      expect(response).to have_http_status(:success)
    end

    it "returns 404 when event does not exist" do
      get :edit, id: @event.id + 100
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET #show" do
    it "returns http success when event exists" do
      get :show, id: @event.id 
      expect(response).to have_http_status(:success)
    end

    it "returns not_found when event does not exist" do
      Event.destroy_all
      get :show, id: @event.id + 1
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST #create" do
    it "returns success" do
      param = { name: 'test event', event_date: '2014-8-9', comment: 'test comment' }
      post :create, event: param
      expect(response).to have_http_status(:found)
      expect(Event.find_by({name: 'test event'})).not_to be_nil
    end
  end

end
