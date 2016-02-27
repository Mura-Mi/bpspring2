require 'rails_helper'

RSpec.describe InterestsController, type: :controller do

  before do
    login_user
    Interest.destroy_all
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    before do
      create(:event_report)
    end
    it 'returns count' do
      expect {
        post :create, interest: { to_type: 'EventReport', to_id: 1, interest_type: 'homerun' }
        post :create, interest: { to_type: 'EventReport', to_id: 1, interest_type: 'homerun' }
      }.to change {
        Interest.count
      }.by(1)

      expect(response.body).to be_json_eql(1).at_path("4")
      expect(response.body).to have_json_size(1)
    end

    it 'creates each' do
      expect {
        post :create, interest: { to_type: 'EventReport', to_id: 1, interest_type: 'homerun' }
        post :create, interest: { to_type: 'EventReport', to_id: 1, interest_type: 'hit' }
      }.to change {
        Interest.count
      }.by(2)

      expect(response.body).to be_json_eql(1).at_path("4")
      expect(response.body).to be_json_eql(1).at_path("1")
      expect(response.body).to have_json_size(2)
    end
  end

end
