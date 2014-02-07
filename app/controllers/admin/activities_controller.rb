module Admin
  class ActivitiesController < ApplicationController
    def create
      @activity = Activity.new(permitted_params)

      if @activity.save
        render json: @activity
      else
        render json: { errors: @activity.errors.full_messages }, status: 422
      end
    end

    private
    def permitted_params
      params.require(:activity).permit(:name)
    end
  end
end
