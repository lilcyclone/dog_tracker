class AddDogReferenceToPotties < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :potties, :dogs
    add_index :potties, :dog_id
    change_column_null :potties, :dog_id, false
  end
end
