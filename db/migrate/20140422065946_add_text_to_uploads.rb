class AddTextToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :text, :text
  end
end
