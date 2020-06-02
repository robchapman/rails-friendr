class Friend < ApplicationRecord

  has_many :friendskills
  has_many :skills, through: :friendskills
  has_many :friendtags
  has_many :tags, through: :friendtags
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
