class Upload < ActiveRecord::Base
  require 'tesseract'

  attr_accessible :upload
  has_attached_file :upload
  validates_attachment_content_type :upload, :content_type => /\Aimage\/.*\Z/

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "text_url" => self.text_url,
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

  def to_text
    e = Tesseract::Engine.new {|e|
      e.language  = :eng
      e.blacklist = '|'
    }
    file_path = "#{Rails.root}/public#{self.upload.url}".split("?")[0]
    content = e.text_for(file_path).strip
    self.text_url = self.upload.url.split("?")[0] + ".txt"
    target = file_path + ".txt"
    File.open(target, "w+") do |f|
      f.write(content)
    end
    self.save!
  end

end
