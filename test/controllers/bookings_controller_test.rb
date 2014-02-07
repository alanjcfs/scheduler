require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  before do
    @schedule = create(:schedule)
  end

  describe "Creating a booking" do
    before do
      post :create, booking: { schedule_id: @schedule.id },
        travelers: [{ name: "Adam" }, { name: "Jason" }, { name: "Jennifer" }]
      @json = JSON.parse(response.body)
    end

    test "the response of the booking is successful" do
      assert_response :success
      assert assigns(:schedule_booker)
    end

    test "the response is not empty" do
      @json["booking"].wont_be_empty
      @json["booking"]["travelers"].wont_be_empty
    end

    test "Adam Jason and Jennifer are in the list of travelers" do
      names = %w[Adam Jason Jennifer]
      # puts json
      @json["booking"]["travelers"].each do |traveler|
        assert names.include?(traveler["name"]), "Adam Jason or Jennifer should be in the name"
      end
    end
  end

  describe "Creating a bad booking" do
    before do
      post :create, booking: { schedule_id: @schedule.id },
        travelers: [{ name: "" }, { name: "Jason" }]
    end

    test "the response of the booking should ignore missing names" do
      json = JSON.parse(response.body)
      json["booking"]["travelers"].count.must_equal 1
    end
  end
end
