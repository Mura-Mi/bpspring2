require 'rails_helper'

RSpec.describe EventReport, type: :model do
  before do
    User.destroy_all
    Event.destroy_all
  end

  after do
    User.destroy_all
    Event.destroy_all
  end

  context "Without mandatory field" do

    it "is invalid without event" do
      user = FactoryGirl.create(:user)
      report = EventReport.new(user: user)

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:event]).to be_present
    end

    it "is invalid without event (construct with id)" do
      user = FactoryGirl.create(:user)
      report = EventReport.new(user_id: user.id)

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:event]).to be_present
    end

    it "is invalid without user" do
      event = FactoryGirl.create(:event)
      report = EventReport.new(event: event)

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:user]).to be_present
    end

    it "is invalid without user (construct with id)" do
      event = FactoryGirl.create(:event)
      report = EventReport.new(event_id: event.id)

      report.valid?
      expect(report.errors).to have(1).item
      expect(report.errors[:user]).to be_present
    end
  end

  context "with invalid entity id" do
    it "is invalid with invalid user id" do
      event = FactoryGirl.create(:event)
      report = EventReport.new(event_id: event.id, user_id: 100)
      report.valid?

      expect(report.errors).not_to be_empty;
      expect(report.errors[:user]).to be_present;
    end

    it "is invalid with invalid event id" do
      user = FactoryGirl.create(:user)
      report = EventReport.new(event_id: 334, user_id: user.id)
      report.valid?

      expect(report.errors).not_to be_empty;
      expect(report.errors[:event]).to be_present;
    end
  end
end
