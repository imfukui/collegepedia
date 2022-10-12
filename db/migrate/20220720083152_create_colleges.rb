class CreateColleges < ActiveRecord::Migration[6.1]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :address
      t.string :sector
      t.integer :estyear
      t.string :mingpa
      t.text :description

      t.timestamps
    end
  end
end
