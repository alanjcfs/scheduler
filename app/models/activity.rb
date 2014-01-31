class Activity < ActiveRecord::Base
  has_many :activity_vendors
  has_many :vendors, through: :activity_vendors
  validates :name, presence: true
end
