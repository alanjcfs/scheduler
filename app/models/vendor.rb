class Vendor < ActiveRecord::Base
  has_many :activity_vendors
  has_many :activities, through: :activity_vendors
end
