class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :username
      t.string :password
      t.string :cars_id
      t.timestamps
    end
  end
end
