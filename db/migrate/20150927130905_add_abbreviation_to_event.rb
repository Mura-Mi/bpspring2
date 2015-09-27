class AddAbbreviationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :abbreviation, :string
  end
end
