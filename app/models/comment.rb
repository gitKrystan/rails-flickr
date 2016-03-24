class Comment < ActiveRecord::Base
  belongs_to :profile
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :content, presence: true
end
