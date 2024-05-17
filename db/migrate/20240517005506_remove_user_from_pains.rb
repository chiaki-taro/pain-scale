class RemoveUserFromPains < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pains, :user, null: false, foreign_key: true
  end
end
