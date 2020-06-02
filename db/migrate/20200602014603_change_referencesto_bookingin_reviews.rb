class ChangeReferencestoBookinginReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:reviews, :session, index: true)
    add_reference(:reviews, :booking, foreign_key: true)
  end
end
