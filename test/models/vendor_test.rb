require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  before do
    @vendor = Vendor.new
  end

  test "should not save without a name" do
    refute @vendor.valid?, "No name"
  end

  test "should save with name" do
    @vendor.name = "Joe the Surf Instructor"
    assert @vendor.valid?, "It can save correctly with name"
  end

  test "vendor has activities" do
    activity = Activity.new(name: "Awesome Surfing Lesson")
    @vendor.activities << activity

    refute @vendor.activities.empty?
  end
end
