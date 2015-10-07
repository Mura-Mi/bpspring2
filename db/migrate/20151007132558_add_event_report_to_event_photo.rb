class AddEventReportToEventPhoto < ActiveRecord::Migration
  def change
    add_reference :event_photos, :event_report, index: true, foreign_key: true
  end
end
