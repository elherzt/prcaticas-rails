class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :car_id
      t.integer :user_id
    end
  end
end
