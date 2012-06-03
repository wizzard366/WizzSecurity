class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.string :password
      t.text :description
      t.integer :residential_id

      t.timestamps
    end
  end
end
