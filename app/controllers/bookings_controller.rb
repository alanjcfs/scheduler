class BookingsController < ApplicationController
  respond_to :json
  def create
    @booking = Booking.new(params.permit(:booking))
    @booking.travelers.build(params.permit(:travelers => []))

    if @booking.save
      render json: @booking
    else
      render json: @booking.errors.full_messages
    end
  end
end
