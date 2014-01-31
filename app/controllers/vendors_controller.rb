class VendorsController < ApplicationController
  respond_to :json

  def create
    @vendor = Vendor.new(permitted_params)
    if @vendor.save
      render json: @vendor
    else
      render json: { errors: @vendor.errors.full_messages }, status: 422
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
    render json: @vendor
  end

  def index
    render json: {}
  end

  private
  def permitted_params
    params.require(:vendor).permit(:name)
  end
end
