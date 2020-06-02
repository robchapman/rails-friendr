class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  has_many :reviews
end
