class Comment < ActiveRecord::Base
  belongs_to :profile
  belongs_to :image
  has_ancestry
  validates :content, presence: true
end
