class CreateFriendSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_skills do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
