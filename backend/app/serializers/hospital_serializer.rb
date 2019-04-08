class HospitalSerializer < ActiveModel::Serializer
  has_many :doctors
  attributes :id, :street, :city, :state, :county, :zip, :phone, :facility_name, :description, :latitude, :longitude
end
