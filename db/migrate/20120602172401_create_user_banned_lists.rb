class CreateUserBannedLists < ActiveRecord::Migration
  def change
    create_table :user_banned_lists do |t|
      t.datetime :begin_time
      t.datetime :end_time
      t.text :description
      t.integer :enabled
      t.integer :visitor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
