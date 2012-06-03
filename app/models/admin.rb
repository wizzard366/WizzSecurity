class Admin < ActiveRecord::Base
  belongs_to :residential
  belongs_to :admin_status
end
