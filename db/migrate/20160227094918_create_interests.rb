class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :from_id, index: true
      t.string :to_type
      t.integer :to_id
      t.integer :interest_type

      t.timestamps null: false
    end
  end
end
