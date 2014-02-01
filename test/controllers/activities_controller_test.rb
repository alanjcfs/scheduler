require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  test "creating an activity" do
    assert_difference('Activity.count') do
      post :create, activity: {name: "Surfing"}
    end

    assert assigns(:activity)
  end

  test "creating an activity without name must fail" do
    assert_raises ActionController::ParameterMissing do
      post :create, activity: {}
    end
  end

  test "obtaining a list of activities" do
    get :index, date_start: Date.parse("2014-01-01"), date_end: Date.parse("2014-01-31")
    assert assigns(:activities)
  end
end
