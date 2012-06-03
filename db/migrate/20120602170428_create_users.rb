class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :password
      t.integer :enabled
      t.integer :telephone
      t.integer :habitants_number
      t.integer :residential_id
      t.integer :user_status_id

      t.timestamps
    end
  end
end
