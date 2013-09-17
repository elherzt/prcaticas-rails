class RemoveColumnMailToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mail
  end
end
