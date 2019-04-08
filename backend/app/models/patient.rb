class Patient < ApplicationRecord
  has_many :visits
  has_many :chats
  has_many :doctors, through: :visits

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :password, presence: true
end
