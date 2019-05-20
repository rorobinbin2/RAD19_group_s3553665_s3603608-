class Course < ApplicationRecord
  belongs_to :category
  belongs_to :location
  belongs_to :user
  # validates :name,  presence: true
  # validates :prerequisite,  presence: true
  # validates :category_id,  presence: true
  # validates :location_id,  presence: true
end
