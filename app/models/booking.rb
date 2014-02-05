class Booking < ActiveRecord::Base
  has_many :travelers
  belongs_to :schedule
end
