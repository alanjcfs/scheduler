require 'test_helper'

module Admin
  class SchedulesControllerTest < ActionController::TestCase
    test "make a schedule unavailable" do
      schedule = create(:schedule)
      patch :change_availability, id: schedule.id, schedule: { available: false }
      assert_response :success
    end
  end
end
