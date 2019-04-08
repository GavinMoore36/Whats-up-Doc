class VisitSerializer < ActiveModel::Serializer
  belongs_to :doctor
  has_one :hospital, through: :doctor
  belongs_to :patient
  attributes :id, :ailment, :description, :doctor, :patient
end
