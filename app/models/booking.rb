class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  has_many :reviews
  validates :friend_id, :user_id, :status, :start_time, :end_time, :total_price, presence: true
end
