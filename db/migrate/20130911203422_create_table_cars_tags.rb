class CreateTableCarsTags < ActiveRecord::Migration
  def change
    create_table :cars_tags, :id => false do |t|
      t.integer :tag_id, :car_id
    end
  end
end
