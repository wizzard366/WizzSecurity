class ResidentialBannedList < ActiveRecord::Base
  belongs_to :residential
  belongs_to :visitor
  belongs_to :residential_banned_status
end
