class AddDescriotionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :user, :description, :text
  end
end
