module Admin
  class SchedulesController < ApplicationController
    respond_to :json

    def create
      @schedule = Schedule.new(permitted_params)
      render json: @schedule
    end

    def change_availability
      @schedule = Schedule.find params[:id]
      @schedule.update_attributes(params.require(:schedule).permit(:available))

      render json: @schedule
    end

    private
    def permitted_params
      params.require(:schedule).permit(:date, :time_start, :time_end, :quantity,
                                       :activity_id, :price)
    end
  end
end
