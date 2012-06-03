class CreateAdminStatuses < ActiveRecord::Migration
  def change
    create_table :admin_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
