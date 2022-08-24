class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :professor
      t.string :department
      t.integer :college_id

      t.timestamps
    end
  end
end
