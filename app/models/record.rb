class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :residential
  belongs_to :visitor
end
