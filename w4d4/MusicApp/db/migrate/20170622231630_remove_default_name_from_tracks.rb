class RemoveDefaultNameFromTracks < ActiveRecord::Migration[5.0]
  def change
    change_column :tracks, :name, :string, default: nil
  end
end
