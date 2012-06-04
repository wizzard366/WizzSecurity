class Supresidfromvisitors < ActiveRecord::Migration
  def change
    change_table :visitors do |t|
    t.remove :residential_id
    end
  end
end
