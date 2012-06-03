class CreateResidentials < ActiveRecord::Migration
  def change
    create_table :residentials do |t|
      t.string :name
      t.string :address
      t.integer :type
      t.text :description
      t.integer :enabled
      t.string :password

      t.timestamps
    end
  end
end
