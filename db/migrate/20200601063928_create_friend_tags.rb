class CreateFriendTags < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_tags do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
