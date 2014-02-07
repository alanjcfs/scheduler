require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  describe "Getting a list of activities" do
    before do
      create(:schedule)
    end

    test "obtaining a list of activities" do
      get :index, date_start: Date.parse("2014-01-01"), date_end: Date.parse("2014-01-31")
      assert assigns(:activities)
      json = JSON.parse(response.body)
      json["activities"].size.must_equal 1
    end

    test "obtaining a list of activities in a day should be fine" do
      date = Date.parse("2014-01-01")
      get :index, date_start: date, date_end: date
      assert assigns(:activities)
    end
  end
end
