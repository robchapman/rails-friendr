class Friend < ApplicationRecord
  has_many :friend_skills, dependent: :destroy
  has_many :skills, through: :friend_skills
  has_many :friend_tags, dependent: :destroy
  has_many :tags, through: :friend_tags
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user
  has_one_attached :photo
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
    # pg_search_scope :global_search, against: [:name, :description],
    # associated_against: {
    #   skills: [:name],tags: [:name]
    # },
    # using: {
    #   tsearch: { prefix: true, dictionary: "english" },
    #   trigram: {},
    #   dmetaphone: {}
    # }
    pg_search_scope :global_search, against: [:name, :description],
    associated_against: {
      skills: [:name],tags: [:name]
    },
    using: {
      tsearch: { prefix: true, dictionary: "english" }
    }
end
# , tag: :name
