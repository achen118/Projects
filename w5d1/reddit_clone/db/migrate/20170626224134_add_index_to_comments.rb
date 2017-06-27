class AddIndexToComments < ActiveRecord::Migration[5.0]
  def change
    add_index :comments, :parent_comment_id
    change_column :comments, :parent_comment_id, :integer, default: nil
  end
end
