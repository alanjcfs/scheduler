require 'test_helper'

class TravelerTest < ActiveSupport::TestCase
  test "traveler has a booking" do
    assert Traveler.new.respond_to? :booking
  end
end
