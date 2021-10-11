class AddDeletedAtToImaginnovates < ActiveRecord::Migration
  def change
    add_column :imaginnovates, :deleted_at, :datetime
    add_index :imaginnovates, :deleted_at
  end
end
