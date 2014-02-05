require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  test "GET index in activities" do
    get :index, activity_id: activities(:joe)
    assert_response :success
    assert assigns(:activity)
    assert assigns(:schedules)
  end
end
