class AddUserIdToImaginnovates < ActiveRecord::Migration
  def change
    add_column :imaginnovates, :user_id, :integer
    add_index :imaginnovates, :user_id
  end
end
