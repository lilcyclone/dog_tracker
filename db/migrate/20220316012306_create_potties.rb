class CreatePotties < ActiveRecord::Migration[6.0]
  def change
    create_table :potties do |t|
      t.integer :dog_id
      t.string :pee_or_poo

      t.timestamps
    end
  end
end
