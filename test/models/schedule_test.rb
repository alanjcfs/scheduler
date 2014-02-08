require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  before do
    date       = Date.today
    time_start = Time.parse("18:00:00")
    time_end   = time_start + 2.hours
    activity   = create(:activity)
    @params    = { date: date,
                   time_start: time_start,
                   time_end: time_end,
                   quantity: 8,
                   activity_id: activity.id }
  end

  test "saves with the current params" do
    Schedule.new(@params).valid?.must_equal true
  end

  test "isn't valid with negative price" do
    Schedule.new(@params.merge(price: -1200)).valid?.must_equal false
  end

  test "isn't valid with fractional number" do
    Schedule.new(@params.merge(price: 12.00)).valid?.must_equal false
  end

  test "isn't valid without times" do
    Schedule.new(@params.merge(time_start: nil)).valid?.must_equal false
    Schedule.new(@params.merge(time_end: nil)).valid?.must_equal false
  end

  test "isn't valid without the date" do
    Schedule.new(@params.merge(date: nil)).valid?.must_equal false
  end

  test "isn't valid without the activity it's pointing to" do
    Schedule.new(@params.merge(activity_id: nil)).valid?.must_equal false
  end
end
