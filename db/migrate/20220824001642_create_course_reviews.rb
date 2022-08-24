class CreateCourseReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :course_reviews do |t|
      t.string :exam
      t.string :quiz
      t.string :assignment
      t.text :gradedist
      t.text :comment
      t.string :gradegot
      t.integer :lesson_id
      t.integer :user_id

      t.timestamps
    end
  end
end
