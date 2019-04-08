class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.text :description
      t.string :username
      t.string :password
      t.string :image
      t.integer :hospital_id
      t.timestamps
    end
  end
end
