require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  describe "Associations" do
    before do
      @booking = Booking.new
    end

    test "booking has travelers" do
      assert @booking.respond_to? :travelers, "A booking has travelers"
    end

    test "booking belongs to schedule" do
      assert @booking.respond_to? :schedule, "A booking belongs to a schedule"
    end
  end

  describe "Creating a booking with travelers" do
    test "booking can be created with travelers" do
      booking = Booking.new(schedule_id: create(:schedule).id)
      booking.travelers.build(name: "Johnny")
      assert booking.save, "Booking should save with a schedule and name of traveler set"
    end
  end
end
