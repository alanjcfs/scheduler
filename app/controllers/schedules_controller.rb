class SchedulesController < ApplicationController
  respond_to :json

  def index
    @activity = Activity.find(params[:activity_id])
    @schedules = @activity.schedules
    render json: @schedules
  end

  def show
    @schedule = Schedule.find(params[:id])
    render json: @schedule
  end

end
