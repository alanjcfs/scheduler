class ScheduleBooker
  attr_reader :booking

  def initialize(booking, travelers)
    @booking = Booking.new(booking)
    @booking.travelers.build(travelers)
  end

  def save
    if @booking.save
      @schedule = Schedule.find @booking.schedule
      @schedule.increment_reserved(@booking.travelers.count)
    end
  end

end
