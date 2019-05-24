class Course < ApplicationRecord
  # has_and_belongs_to_many :categories
  # has_and_belongs_to_many :locations
  belongs_to :category
  belongs_to :location
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :name,  presence: true
  validates :prerequisite,  presence: true
  validates :category,  presence: true
  validates :location,  presence: true
end
