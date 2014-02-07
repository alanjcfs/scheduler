require 'test_helper'

module Admin
  class ActivitiesControllerTest < ActionController::TestCase
    describe "Creating an activity" do
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
  end
end
