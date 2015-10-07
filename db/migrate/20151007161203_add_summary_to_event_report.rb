class AddSummaryToEventReport < ActiveRecord::Migration
  def change
    add_column :event_reports, :summary, :string
  end
end
