class Image < ActiveRecord::Base
  belongs_to :profile
  has_many :comments
  has_attached_file :file, styles: { medium: '300x300', thumbnail: '100x100' }
  validates_attachment :file, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ }
end
