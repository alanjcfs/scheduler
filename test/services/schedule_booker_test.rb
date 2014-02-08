require 'test_helper'

class ScheduleBookerTest < ActiveSupport::TestCase
  test "schedule booker" do
    schedule_booker = ScheduleBooker.new
    schedule_booker.booking.must_be_kind_of Booking
  end

  test "schedule booker should not save if unavailable" do
    schedule = create(:sold_out_schedule)
    schedule_booker = ScheduleBooker.new(booking: { schedule_id: schedule.id},
                                         travelers: { name: "Oliver" })
    schedule_booker.save.must_equal false
  end
end
