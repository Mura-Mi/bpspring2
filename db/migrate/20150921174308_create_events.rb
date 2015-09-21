class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.text :comment
      t.references :place

      t.timestamps null: false
    end
  end
end
