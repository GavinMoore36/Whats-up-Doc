class DoctorSerializer < ActiveModel::Serializer
  belongs_to :hospital
  has_many :visits
  has_many :patients, through: :visits
  # has_many :chats
  attributes :id, :name, :specialty, :description, :image, :username, :password
end
