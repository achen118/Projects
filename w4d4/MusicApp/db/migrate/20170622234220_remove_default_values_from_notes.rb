class RemoveDefaultValuesFromNotes < ActiveRecord::Migration[5.0]
  def change
    change_column :notes, :user_id, :integer, default: nil
    change_column :notes, :track_id, :integer, default: nil
  end
end
