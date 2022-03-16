class AddDogReferenceToFeedings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :feedings, :dogs
    add_index :feedings, :dog_id
    change_column_null :feedings, :dog_id, false
  end
end
