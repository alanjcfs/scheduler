class SchedulesController < ApplicationController
  respond_to :json

  def index
    @activity = Activity.find(params[:activity_id])
    @schedules = @activity.schedules
    render json: @schedules
  end
end
