class AddRateToCourseReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :course_reviews, :rate, :integer
  end
end
