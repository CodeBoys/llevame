class Photo < ActiveRecord::Base
  belongs_to :dog
  has_attached_file :photo,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :styles => {
		  :medium => ["600x*>", :jpg], :mini => ["60x60#", :jpg]
    },
    :convert_options => {
      :mini => "-quality 50 -strip",
      :medium  => "-quality 85 -strip"
      }


  # Validate content type
  validates_attachment :photo,
  :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif",
  	"image/png"]
  }
  # Validate filename
  validates_attachment_file_name :photo, :matches => [/png\Z/,/PNG\Z/,
   /JPG\Z/, /JPE?G\Z/, /jpe?g\Z/]
end
