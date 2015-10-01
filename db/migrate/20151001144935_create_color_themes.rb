class CreateColorThemes < ActiveRecord::Migration
  def change
    create_table :color_themes do |t|
      t.string :theme_name
      t.string :style_file_name

      t.timestamps null: false
    end
    
    add_reference :users, :color_theme, index: true, foreign_key: true
  end
end
