class CreateFeedings < ActiveRecord::Migration[6.0]
  def change
    create_table :feedings do |t|
      t.integer :dog_id
      t.string :amount
      t.string :food_name

      t.timestamps
    end
  end
end
