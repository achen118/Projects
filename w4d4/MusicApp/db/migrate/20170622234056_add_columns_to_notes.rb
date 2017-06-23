class AddColumnsToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :user_id, :integer, null: false, default: 0
    add_column :notes, :track_id, :integer, null: false, default: 0
    add_index :notes, :user_id
    add_index :notes, :track_id
  end
end
