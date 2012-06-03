class CreateResidentialTypes < ActiveRecord::Migration
  def change
    create_table :residential_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
