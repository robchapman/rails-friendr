class Friend < ApplicationRecord
  has_many :friendskills
  has_many :skills, through: :friendskill
end
