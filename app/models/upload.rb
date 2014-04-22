class Upload < ActiveRecord::Base
  require 'tesseract'

  attr_accessible :upload
  has_attached_file :upload

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

  def to_text
    e = Tesseract::Engine.new {|e|
      e.language  = :eng
      e.blacklist = '|'
    }
    self.text = e.text_for( "#{Rails.root}/public#{self.upload.url}".split("?")[0] ).strip
    self.save!
  end

end
