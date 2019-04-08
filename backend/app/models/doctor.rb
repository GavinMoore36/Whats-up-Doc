class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :visits
  has_many :chats
  has_many :patients, through: :visits

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
end
