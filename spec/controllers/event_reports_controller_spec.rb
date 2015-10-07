require 'rails_helper'

RSpec.describe EventReportsController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
    @event = FactoryGirl.create(:event)
  end

  after do
    User.destroy_all
    Event.destroy_all
  end

  let(:valid_attributes) {
    { user_id: @user.id, event_id: @event.id, comment: "My Comment", summary: 'sum'}
  }

  let(:invalid_attributes) {
    { user_id: 225, event_id: 334, comment: "My Comment"}
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested event_report as @event_report" do
      event_report = EventReport.create! valid_attributes
      get :show, {:id => event_report.to_param}, valid_session
      expect(assigns(:event_report)).to eq(event_report)
    end
  end

  describe "GET #new" do
    it "assigns a new event_report as @event_report" do
      get :new, { user_id: @user.id, event_id: @event.id }, valid_session
      expect(assigns(:event_report)).to be_a_new(EventReport)
    end
  end

  describe "GET #edit" do
    it "assigns the requested event_report as @event_report" do
      event_report = EventReport.create! valid_attributes
      get :edit, {:id => event_report.to_param}, valid_session
      expect(assigns(:event_report)).to eq(event_report)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EventReport" do
        expect {
          post :create, {:event_report => valid_attributes}, valid_session
        }.to change(EventReport, :count).by(1)
        expect(response).to redirect_to(EventReport.last)
      end

      it "assigns a newly created event_report as @event_report" do
        post :create, {:event_report => valid_attributes}, valid_session
        expect(assigns(:event_report)).to be_a(EventReport)
        expect(assigns(:event_report)).to be_persisted
      end

      it "redirects to the created event_report" do
        post :create, {:event_report => valid_attributes}, valid_session
        expect(response).to redirect_to(EventReport.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved event_report as @event_report" do
        post :create, {:event_report => invalid_attributes}, valid_session
        expect(assigns(:event_report)).to be_a_new(EventReport)
      end

      it "re-renders the 'new' template" do
        post :create, {:event_report => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { comment: 'New Comment', user_id: @user.id, event_id: @event.id }
      }

      it "updates the requested event_report" do
        event_report = EventReport.create! valid_attributes
        put :update, {:id => event_report.to_param, :event_report => new_attributes}, valid_session
        event_report.reload
        expect(assigns(:event_report).comment).to eq('New Comment')
      end

      it "assigns the requested event_report as @event_report" do
        event_report = EventReport.create! valid_attributes
        put :update, {:id => event_report.to_param, :event_report => valid_attributes}, valid_session
        expect(assigns(:event_report)).to eq(event_report)
      end

      it "redirects to the event_report" do
        event_report = EventReport.create! valid_attributes
        put :update, {:id => event_report.to_param, :event_report => valid_attributes}, valid_session
        expect(response).to redirect_to(event_report)
      end
    end

    context "with invalid params" do
      it "assigns the event_report as @event_report" do
        event_report = EventReport.create! valid_attributes
        put :update, {:id => event_report.to_param, :event_report => invalid_attributes}, valid_session
        expect(assigns(:event_report)).to eq(event_report)
      end

      it "re-renders the 'edit' template" do
        event_report = EventReport.create! valid_attributes
        put :update, {:id => event_report.to_param, :event_report => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event_report" do
      event_report = EventReport.create! valid_attributes
      expect {
        delete :destroy, {:id => event_report.to_param}, valid_session
      }.to change(EventReport, :count).by(-1)
    end

    it "redirects to the event_reports list" do
      event_report = EventReport.create! valid_attributes
      delete :destroy, {:id => event_report.to_param}, valid_session
      expect(response).to redirect_to(event_reports_url)
    end
  end

end
