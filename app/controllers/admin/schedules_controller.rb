module Admin
  class SchedulesController < ApplicationController
    respond_to :json

    def change_availability
      @schedule = Schedule.find params[:id]
      @schedule.update_attributes(params.require(:schedule).permit(:available))

      render json: @schedule
    end
  end
end
