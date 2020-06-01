class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.datetime :start_time
      t.datetime :end_time
      t.float :total_price

      t.timestamps
    end
  end
end
