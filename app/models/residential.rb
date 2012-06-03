class Residential < ActiveRecord::Base
  has_many :agents
  has_many :users
  has_many :admins
  has_many :residential_banned_lists
  has_many :visitors_records, :through => :records, :source => :visitors
  has_many :banned_visitors, :through => :residential_banned_lists, :source => :visitors
  has_many :records
  belongs_to :residential_type
  
  
end
