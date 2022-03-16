class AddUserReferenceToOwnerships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ownerships, :users
    add_index :ownerships, :user_id
    change_column_null :ownerships, :user_id, false
  end
end
