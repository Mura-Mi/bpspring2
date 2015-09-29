require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    it "returns http not found" do
      get :show, id: 100
      expect(response).to have_http_status(:not_found)
    end

    it "returns http success" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id

      expect(response).to have_http_status(:success)
    end
  end

end
