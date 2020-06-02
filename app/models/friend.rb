class Friend < ApplicationRecord

  has_many :friendskills
  has_many :skills, through: :friendskill

  has_one_attached :photo

end
