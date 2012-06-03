class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :entrance
      t.datetime :exit
      t.string :plate_number
      t.integer :visitor_id
      t.integer :user_id
      t.integer :residential_id

      t.timestamps
    end
  end
end
