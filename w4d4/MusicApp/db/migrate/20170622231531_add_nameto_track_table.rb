class AddNametoTrackTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :name, :string, null: false, default: 0
  end
end
