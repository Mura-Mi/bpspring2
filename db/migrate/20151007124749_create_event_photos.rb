class CreateEventPhotos < ActiveRecord::Migration
  def change
    create_table :event_photos do |t|
      t.string :title
      t.text :comment
      t.string :photo

      t.timestamps null: false
    end
  end
end
