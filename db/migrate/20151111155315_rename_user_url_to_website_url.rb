class RenameUserUrlToWebsiteUrl < ActiveRecord::Migration
  def change
    rename_column :users, :url, :website_url
  end
end
