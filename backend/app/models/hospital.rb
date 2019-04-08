class Hospital < ApplicationRecord
  has_many :doctors

  validates_length_of :phone, :minimum => 10
  # validates :street, presence: true
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :county, presence: true
  # validates :zip, presence: true
  # validates :facility_name, presence: true
  # validates :description, presence: true
end
