class UserBannedList < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :user
end
