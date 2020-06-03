class Booking < ApplicationRecord
  belongs_to :friend
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :total_price, presence: true, numericality: { only_float: true }
  validates :status, inclusion: { in: %w(pending confirmed complete),
    message: "%{value} is not a valid status state" }
  validate :end_date_must_be_before_start_date

  #end date and start date right way round
  def end_date_must_be_before_start_date
    if start_time > end_time
      errors.add(:end_date, "End Date must be after Start Date")
    end
  end
end
