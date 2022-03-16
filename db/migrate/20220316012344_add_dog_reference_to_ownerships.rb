class AddDogReferenceToOwnerships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ownerships, :dogs
    add_index :ownerships, :dog_id
    change_column_null :ownerships, :dog_id, false
  end
end
