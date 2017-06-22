class AddNullConstrainttoUserIdInCats < ActiveRecord::Migration
  def change
    change_column :cats, :user_id, :integer, null: false, default: 0
  end
end
