require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success when not logged in" do
      get :index
      expect(response).to redirect_to(root_path)
    end
  end

end
