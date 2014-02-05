require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  test "GET index" do
    get :index, activity_id: activities(:joe)
    assert_response :success
    assert assigns(:activity)
    assert assigns(:schedules)
  end

  test "GET show" do
    get :show, activity_id: activities(:joe), id: schedules(:surfing)
    assert_response :success
    assert assigns(:schedule)
    json = JSON.parse(response.body)
    refute json.empty?, "The response body must not be empty"
    json["schedule"].wont_be_nil
    json["schedule"]["quantity"].must_be :==, 8
  end

end
