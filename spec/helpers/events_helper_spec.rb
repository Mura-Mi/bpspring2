require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do

  context "user not logged in" do
    let(:event) { create(:event) }

    after do
      Event.destroy_all
    end

    describe "not_post_yet" do
      it "returns false" do
        expect(EventsHelper.not_post_yet(event, nil)).to eq(false)
      end
    end

    describe "posted_report_id" do
      it "returns false" do
        expect(EventsHelper.posted_report_id(event, nil)).to eq(nil)
      end
    end
  end

  context "user logged in" do

    let(:user) { create(:user) }
    let(:event) { create(:event) }

    before do
      EventReport.destroy_all
      for i in 1..5 do
        create(:event_report)
      end
    end

    after do
      User.destroy_all
      Event.destroy_all
    end

    describe "not_post_yet" do
      it "returns true when user has not post a report for a event" do
        expect(EventsHelper.not_post_yet(event, user)).to eq(true)
      end

      it "returns false when user has post a report for a event" do
        EventReport.create(event: event, user: user, summary: 'hoge')
        expect(EventsHelper.not_post_yet(event, user)).to eq(false)
      end
    end

    describe "posted_report_id" do
      it "returns false when user has not post a report for a event" do
        expect(EventsHelper.posted_report_id(event, user)).to eq(nil)
      end

      it "returns true when user has post a report for a event" do
        report = EventReport.create(event: event, user: user, summary: 'hoge')
        expect(EventsHelper.posted_report_id(event, user)).to eq(report.id)
      end
    end

    context "multiple event" do
      let(:another) { create(:event) }

      describe "not_post_yet" do
        it "returns true for new event" do
          expect(EventsHelper.not_post_yet(another, user)).to eq(true)
        end
      end

      describe "posted_report_id" do
        it "returns nil for new event" do
          expect(EventsHelper.posted_report_id(another, user)).to be_nil
        end
      end
    end

  end
end
