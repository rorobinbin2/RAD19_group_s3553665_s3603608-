class Course < ApplicationRecord
  belongs_to :category
  belongs_to :location
  belongs_to :user
end
