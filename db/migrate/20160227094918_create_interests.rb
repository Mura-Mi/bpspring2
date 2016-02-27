class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :from, index: true, foreign_key: true
      t.string :to_type
      t.integer :to_id
      t.integer :interest_type

      t.timestamps null: false
    end
  end
end
