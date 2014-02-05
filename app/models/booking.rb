class Booking < ActiveRecord::Base
  has_many :travelers
  belongs_to :schedule

  validates :schedule_id, presence: true
end
