class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
end
