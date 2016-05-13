class Photo < ActiveRecord::Base
  belongs_to :photographer

  has_attached_file :image, 
  					styles: { medium: "360x240", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
end
