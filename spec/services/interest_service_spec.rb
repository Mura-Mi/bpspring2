require 'rails_helper'
RSpec.describe InterestService, type: "service" do

  let(:user)    { create(:user) }
  let(:event_report) { create(:event_report) }
  let(:service) { InterestService.new(user)}

  describe "register_interest" do
    context "no interest registered" do
      it "returns new instance" do
        i = service.register_interest("EventReport", event_report.id, 'hit')
        expect(i.user).to eq user
      end

      it "registers new record" do
        expect {
          service.register_interest("EventReport", event_report.id, 'hit')
        }.to change {
          Interest.count
        }.by(1)
      end
    end

    context "already interest is registered" do
      before  do
        @registered = service.register_interest("EventReport", event_report.id, 'hit')
      end

      it "returns registered interest" do
        i = service.register_interest("EventReport", event_report.id, 'hit')

        expect(i).to eq @registered
      end

      it "does not register new instance" do
        expect {
          service.register_interest("EventReport", event_report.id, 'hit')
        }.not_to change {
          Interest.count
        }
      end
    end
  end
end
