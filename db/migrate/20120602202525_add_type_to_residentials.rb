class AddTypeToResidentials < ActiveRecord::Migration
  def change
    change_table :residentials do |t|
    t.remove :type
    t.integer :residential_type_id
    end
  end
end
