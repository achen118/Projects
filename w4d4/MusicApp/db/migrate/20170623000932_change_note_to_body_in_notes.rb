class ChangeNoteToBodyInNotes < ActiveRecord::Migration[5.0]
  def change
    rename_column :notes, :note, :body
  end
end
