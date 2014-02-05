require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  describe "Creating a booking" do
    before do
      post :create, booking: { schedule_id: schedules(:surfing) },
        travelers: [{ name: "Adam" }, { name: "Jason" }, { name: "Jennifer" }]
    end

    test "the response of the booking" do
      assert_response :success
      assert assigns(:booking)
      json = JSON.parse(response.body)
      json["booking"].wont_be_empty
      json["booking"]["travelers"].wont_be_empty
      names = %w[Adam Jason Jennifer]
      puts json
      json["booking"]["travelers"].each do |traveler|
        assert names.include?(traveler["name"]), "Adam Jason or Jennifer should be in the name"
      end
    end
  end
end
