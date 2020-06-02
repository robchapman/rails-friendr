class ChangeSessionsNameToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_table :sessions, :bookings
  end
end
