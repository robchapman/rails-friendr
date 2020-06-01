class FriendSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :friend
end
