require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  describe "Normal Schedule" do
    before do
      @activity = create(:activity)
      @schedule = create(:schedule)
    end

    test "GET index" do
      get :index, activity_id: @activity.id
      assert_response :success
      assert assigns(:activity)
      assert assigns(:schedules)
    end

    test "GET show" do
      get :show, id: @schedule.id
      assert_response :success
      assert assigns(:schedule)
      json = JSON.parse(response.body)
      refute json.empty?, "The response body must not be empty"
      json["schedule"].wont_be_nil
      json["schedule"]["quantity"].must_equal 8
    end
  end

  describe "Sold Out Schedule" do
    before do
      @schedule = create(:sold_out_schedule)
    end

    test "GET show" do
      get :show, id: @schedule.id
      json = JSON.parse(response.body)
      json["schedule"]["sold_out"].must_equal true
    end
  end

  describe "Unavailable Schedule" do
    before do
      @schedule = create(:unavailable_schedule)
    end

    test "GET show on unavailable schedule" do
      get :show, id: @schedule.id
      json = JSON.parse(response.body)
      json["schedule"]["available"].must_equal false
    end
  end
end
