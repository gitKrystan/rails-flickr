class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :images
  has_many :comments
  has_and_belongs_to_many :favorites, class_name: 'Image'
end
