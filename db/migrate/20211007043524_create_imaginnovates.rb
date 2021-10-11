class CreateImaginnovates < ActiveRecord::Migration
  def change
    create_table :imaginnovates do |t|
      t.string :first_name
      t.string :last_name
      t.string :designation
      t.string :email

      t.timestamps null: false
    end
  end
end
