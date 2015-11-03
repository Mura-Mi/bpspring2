class CreateSnsProfiles < ActiveRecord::Migration
  def change
    create_table :sns_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :nickname

      t.timestamps null: false
    end
  end
end
