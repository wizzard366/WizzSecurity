class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :user_name
      t.string :password
      t.text :description
      t.integer :residential_id
      t.integer :admin_status_id

      t.timestamps
    end
  end
end
