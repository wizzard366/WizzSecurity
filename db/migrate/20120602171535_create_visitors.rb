class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :identification
      t.string :idpictureurl
      t.integer :residential_id
      t.integer :visitor_status_id

      t.timestamps
    end
  end
end
