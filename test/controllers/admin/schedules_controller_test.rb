require 'test_helper'

module Admin
  class SchedulesControllerTest < ActionController::TestCase
    describe "Creating a schedule with price" do
      test "create a schedule" do
        date       = Date.today
        time_start = Time.parse("18:00:00")
        time_end   = time_start + 2.hours
        activity   = create(:activity)

        post :create, schedule: { date: date, time_start: time_start, time_end: time_end, quantity: 8, activity_id: activity, price: 1200 }

        assert assigns(:schedule), "Schedule should be set as an instance variable"

        json = JSON.parse(response.body)
        json["schedule"].wont_be_nil
      end
    end

    describe "Making a Schedule unavailable" do
      test "make a schedule unavailable" do
        schedule = create(:schedule)
        patch :change_availability, id: schedule.id, schedule: { available: false }
        assert_response :success
      end
    end
  end
end
