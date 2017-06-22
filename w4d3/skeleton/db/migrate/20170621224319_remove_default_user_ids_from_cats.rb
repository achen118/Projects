class RemoveDefaultUserIdsFromCats < ActiveRecord::Migration
  def change
    change_column :cats, :user_id, :integer, default: nil
  end
end
