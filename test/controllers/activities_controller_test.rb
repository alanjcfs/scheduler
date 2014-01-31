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
end
