class Schedule < ActiveRecord::Base
  belongs_to :activity
  has_many :bookings

end
