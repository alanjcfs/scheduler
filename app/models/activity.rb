class Activity < ActiveRecord::Base
  has_many :activity_vendors
  has_many :vendors, through: :activity_vendors
  has_many :schedules

  validates :name, presence: true
end
