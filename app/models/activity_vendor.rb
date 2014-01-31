class ActivityVendor < ActiveRecord::Base
  belongs_to :activity
  belongs_to :vendor
end
