require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  before do
    @activity = Activity.new
  end

  test "it should not save without name" do
    refute @activity.valid?, "No name"
  end

  test "it should save with name" do
    @activity.name = "Surfing Lesson"
    assert @activity.valid?, "It can save correctly with name"
  end
end
