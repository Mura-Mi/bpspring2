require 'rails_helper'

RSpec.describe EventReport, type: :model do
  let(:user) {create(:user)}
  let(:event) {create(:event)}
  let(:place) {create(:place)}

  after do
    User.destroy_all
    Event.destroy_all
  end

  describe "Field Validation" do
    describe "event" do
      it "is invalid if empty" do
        report = EventReport.new(user: user, summary: 'sum')

        report.valid?
        expect(report.errors).to have(1).item
        expect(report.errors[:event]).to be_present
      end

      it "is invalid if empty (construct with user_id)" do
      report = EventReport.new(user_id: user.id, summary: 'sum')

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:event]).to be_present
      end

      it "is invalid with invalid id" do
        report = EventReport.new(event_id: 334, user_id: user.id, summary: 'sum')
        report.valid?

        expect(report.errors).not_to be_empty;
        expect(report.errors[:event]).to be_present;
      end
    end

    describe "user" do
      it "is invalid with empty" do
        report = EventReport.new(event: event, summary: 'sum')

        report.valid?
        expect(report.errors).to have(1).item
        expect(report.errors[:user]).to be_present
      end

      it "is invalid with empty (construct with id)" do
        report = EventReport.new(event_id: event.id, summary: 'sum')

        report.valid?
        expect(report.errors).to have(1).item
        expect(report.errors[:user]).to be_present
      end

      it "is invalid with invalid id" do
        report = EventReport.new(event_id: event.id, user_id: 100, summary: 'sum')
        report.valid?

        expect(report.errors).not_to be_empty;
        expect(report.errors[:user]).to be_present;
      end
    end

    describe "summary" do
      it "is invalid if empty" do
        report = EventReport.new(event_id: event.id, user_id: user.id)

        report.valid?
        expect(report.errors).to have(1).item
        expect(report.errors[:summary]).to be_present
      end

      it "is valid with 30 char" do
        report = EventReport.new(event: event, user: user, summary: 'a' * 30)
        report.valid?

        expect(report.errors).to be_empty
      end

      it "is invalid with 31 char" do
        report = EventReport.new(event: event, user: user, summary: 'a' * 31)
        report.valid?

        expect(report.errors).to have(1).item
        expect(report.errors[:summary]).to be_present
      end

    end
  end

  describe "scope" do
    context "held_in" do
      it "includes events held in given place" do
        report = create(:event_report);
        scoped = EventReport.held_in(report.event.place.id)

        expect(scoped).to have(1).item
        expect(scoped).to include(report)
      end

      it "does not include event held in given place" do
        report = create(:event_report);
        scoped = EventReport.held_in(create(:place).id)

        expect(scoped).to be_empty
      end
    end
  end

end
