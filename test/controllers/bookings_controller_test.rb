require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  test "creating a booking" do
    post :create, booking: { schedule_id: schedules(:surfing) },
      travelers: [{ name: "Adam" }, { name: "Jason" }, { name: "Jennifer" }]

    assert_response :success
    assert assigns(:booking)
    json = JSON.parse(response.body)
    json["booking"].wont_be_empty
    json["booking"]["travelers"].wont_be_empty
  end
end
