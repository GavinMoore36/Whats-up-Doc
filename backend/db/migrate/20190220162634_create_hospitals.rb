class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :county
      t.integer :zip
      t.string :phone
      t.string :facility_name
      t.string :description
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
