class Image < ActiveRecord::Base
  belongs_to :profile
  has_attached_file :file
  # , styles: { medium: '300x300', thumbnail: '100x100' }
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
end
