class PatientSerializer < ActiveModel::Serializer
  has_many :visits
  has_many :doctors, through: :visits
  # has_many :chats
  attributes :id, :first_name, :last_name, :description, :image, :username, :password
end
