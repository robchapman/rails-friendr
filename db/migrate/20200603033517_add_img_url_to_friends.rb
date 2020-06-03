class AddImgUrlToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :img_url, :string
  end
end
