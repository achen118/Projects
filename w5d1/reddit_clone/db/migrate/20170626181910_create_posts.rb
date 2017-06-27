class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :content
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :posts, :user_id
  end
end
