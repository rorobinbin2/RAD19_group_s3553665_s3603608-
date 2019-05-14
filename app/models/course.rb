class Course < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
end
