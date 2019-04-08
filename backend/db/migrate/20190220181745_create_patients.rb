class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :username
      t.string :password
      t.string :image, default: "https://cnam.ca/wp-content/uploads/2018/06/default-profile.gif"
      t.string :username
      # t.string :password_digest

      t.timestamps
    end
  end
end
