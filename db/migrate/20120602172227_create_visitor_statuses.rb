class CreateVisitorStatuses < ActiveRecord::Migration
  def change
    create_table :visitor_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
