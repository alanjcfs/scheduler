class Activity < ActiveRecord::Base
  has_many :activity_vendors
  has_many :vendors, through: :activity_vendors
  has_many :schedules

  validates :name, presence: true

  scope :list_of_activities, lambda { |params=nil|
    return all unless params
    joins(:schedules).where(schedules: {date: params[:date_start]..params[:date_end]})
  }
end
