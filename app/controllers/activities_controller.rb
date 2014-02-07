class ActivitiesController < ApplicationController
  respond_to :json
  def index
    @activities = Activity.list_of_activities(params.permit(:date_start, :date_end))
    render json: @activities
  end
end
