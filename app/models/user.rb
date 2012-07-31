class User < ActiveRecord::Base
  belongs_to :residential
  belongs_to :user_status
  has_many :records
  has_many :user_banned_lists,:dependent => :destroy
  has_many :visitors, :through => :records
  has_many :banned_visitors, :through => :user_banned_lists, :source => :visitor
end
