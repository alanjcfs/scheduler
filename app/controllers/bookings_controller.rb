class BookingsController < ApplicationController
  respond_to :json

  def create
    @schedule_booker = ScheduleBooker.new(booking: permitted_booking,
                                          travelers: permitted_travelers)

    if @schedule_booker.save
      render json: @schedule_booker.booking
    else
      render json: @schedule_booker.booking.errors.full_messages
    end
  end

  private
  def permitted_booking
    params.require(:booking).permit(:schedule_id)
  end

  def permitted_travelers
    params.require(:travelers)
  end
end
