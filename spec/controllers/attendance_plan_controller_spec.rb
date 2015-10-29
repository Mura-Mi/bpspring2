require 'rails_helper'

RSpec.describe AttendancePlanController, type: :controller do
  before do
    login_user
  end

  let(:user) { create(:user) }
  let(:event) { create(:event) }
  let(:valid_attributes) {
    { format: 'js', attendance_plan: {user_id: user.id, event_id: event.id} }
  }

  describe "GET #create" do

    it "returns http success" do
      post :create, valid_attributes
      expect(response).to have_http_status(:success)
    end

    it "registers new record" do
      expect { post :create, valid_attributes }.to \
        change { AttendancePlan.count }.by(1)
    end
  end

  describe "GET #delete" do
    before do
      @at = AttendancePlan.create({user_id: user.id, event_id: event.id})
    end

    it "returns http success" do
      xhr :get, :delete, valid_attributes
      expect(response).to have_http_status(:success)
    end

    it "should delete record" do
      expect { xhr :get, :delete, valid_attributes }.to \
        change { AttendancePlan.count }.by(-1)
    end
  end

end
