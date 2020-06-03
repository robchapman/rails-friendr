class Friend < ApplicationRecord
  has_many :friend_skills, dependent: :destroy
  has_many :skills, through: :friendskills
  has_many :friend_tags, dependent: :destroy
  has_many :tags, through: :friendtags
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
  belongs_to :user


  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
