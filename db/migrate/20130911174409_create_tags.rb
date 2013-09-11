class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :tags_cars, :id => false do |t|
      t.integer :tag_id, :car_id
    end
  end
end
