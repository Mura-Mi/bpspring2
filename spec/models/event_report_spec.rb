require 'rails_helper'

RSpec.describe EventReport, type: :model do
  let(:user) {create(:user)}
  let(:event) {create(:event)}

  after do
    User.destroy_all
    Event.destroy_all
  end

  context "Field Validation" do

    it "is invalid without event" do
      report = EventReport.new(user: user, summary: 'sum')

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:event]).to be_present
    end

    it "is invalid without event (construct with id)" do
      report = EventReport.new(user_id: user.id, summary: 'sum')

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:event]).to be_present
    end

    it "is invalid without user" do
      report = EventReport.new(event: event, summary: 'sum')

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:user]).to be_present
    end

    it "is invalid without user (construct with id)" do
      report = EventReport.new(event_id: event.id, summary: 'sum')

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:user]).to be_present
    end

    it "is invalid without summary" do
      report = EventReport.new(event_id: event.id, user_id: user.id)

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:summary]).to be_present
    end

    it "is valid with 30 char summary" do
      report = EventReport.new(event: event, user: user, summary: 'a' * 30)
      report.valid?

      expect(report.errors).to be_empty
    end

    it "is invalid with 31 char summary" do
      report = EventReport.new(event: event, user: user, summary: 'a' * 31)
      report.valid?

      expect(report.errors).to have(1).item
      expect(report.errors[:summary]).to be_present
    end
  end

  context "with invalid entity id" do
    it "is invalid with invalid user id" do
      report = EventReport.new(event_id: event.id, user_id: 100, summary: 'sum')
      report.valid?

      expect(report.errors).not_to be_empty;
      expect(report.errors[:user]).to be_present;
    end

    it "is invalid with invalid event id" do
      report = EventReport.new(event_id: 334, user_id: user.id, summary: 'sum')
      report.valid?

      expect(report.errors).not_to be_empty;
      expect(report.errors[:event]).to be_present;
    end
  end
end
