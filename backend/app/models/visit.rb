class Visit < ApplicationRecord
  belongs_to :doctor
  has_one :hospital, through: :doctor
  belongs_to :patient
end
