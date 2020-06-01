class FriendTag < ApplicationRecord
  belongs_to :friend
  belongs_to :tag
end
