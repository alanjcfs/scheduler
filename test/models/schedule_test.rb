require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  test "it saves with the following attributes set" do
    date       = Date.today
    time_start = Time.parse("18:00:00")
    time_end   = time_start + 2.hours
    activity   = create(:activity)

    Schedule.new(date: date, time_start: time_start, time_end: time_end, quantity: 8, activity_id: activity).valid?.must_equal true

    Schedule.new(date: date, time_start: time_start, time_end: time_end, quantity: 8, activity_id: activity, price: -1200).valid?.must_equal false
  end
end
