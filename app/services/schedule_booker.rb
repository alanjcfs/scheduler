class ScheduleBooker
  attr_reader :booking

  def initialize(permitted_params={})
    @booking = Booking.new(permitted_params[:booking])
    @booking.travelers.build(remove_empty(permitted_params[:travelers])) if permitted_params[:travelers]
  end

  def save
    @schedule = Schedule.find @booking.schedule
    return false unless @schedule.available_to_buy?

    if @booking.save
      @schedule.increment_reserved(@booking.travelers.count)
    end
  end

  def booking
    @booking
  end

  def travelers
    @booking.travelers
  end

  private

  def remove_empty(travelers)
    travelers.select { |t| !t["name"].empty? }
  end

end
