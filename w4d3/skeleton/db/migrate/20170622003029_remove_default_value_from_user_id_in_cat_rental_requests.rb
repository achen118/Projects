class RemoveDefaultValueFromUserIdInCatRentalRequests < ActiveRecord::Migration
  def change
    change_column :cat_rental_requests, :user_id, :integer, default: nil
  end
end
