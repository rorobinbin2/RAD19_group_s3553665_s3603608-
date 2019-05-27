class AddLikeAndDislikeToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :like, :integer, default: 0
    add_column :courses, :dislike, :integer, default: 0
  end
end
