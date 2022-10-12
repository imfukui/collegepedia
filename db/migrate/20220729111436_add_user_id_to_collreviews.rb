class AddUserIdToCollreviews < ActiveRecord::Migration[6.1]
  def change
    add_column :collreviews, :user_id, :integer
    add_column :collreviews, :college_id, :integer
  end
end
