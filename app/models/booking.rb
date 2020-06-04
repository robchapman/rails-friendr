class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :friend_id, :user_id, :status, :start_time, :end_time, presence: true
  validates :total_price, presence: true, numericality: { only_float: true }
  validates :status, inclusion: { in: %w(pending confirmed complete), message: "%{value} is not a valid status state" }

  validate :end_date_must_be_before_start_date

  # end date and start date right way round
  def end_date_must_be_before_start_date
    return unless start_time && end_time

    errors.add(:end_time, "End Time must be after Start Time") if start_time > end_time
  end
end
