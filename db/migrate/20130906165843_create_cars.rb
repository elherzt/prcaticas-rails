class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.integer :user_id
      t.timestamps
    end
  end
end
