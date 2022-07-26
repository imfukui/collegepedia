class CreateCollreviews < ActiveRecord::Migration[6.1]
  def change
    create_table :collreviews do |t|
      t.string :sub
      t.string :tuition
      t.string :scale
      t.text :environment
      t.text :pros
      t.text :cons

      t.timestamps
    end
  end
end
