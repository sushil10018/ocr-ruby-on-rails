class AddTextUrlToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :text_url, :string
  end
end
