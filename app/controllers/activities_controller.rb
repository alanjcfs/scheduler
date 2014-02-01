class ActivitiesController < ApplicationController
  respond_to :json
  def create
    @activity = Activity.new(permitted_params)

    if @activity.save
      render json: @activity
    else
      render json: { errors: @activity.errors.full_messages }, status: 422
    end
  end

  def index
    @activities = Activity.list_of_activities(params.permit(:date_start, :date_end))
    render json: @activities
  end

  private
  def permitted_params
    params.require(:activity).permit(:name)
  end
end
