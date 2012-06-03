class CreateResidentialBannedStatuses < ActiveRecord::Migration
  def change
    create_table :residential_banned_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
