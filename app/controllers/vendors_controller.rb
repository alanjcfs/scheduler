class VendorsController < ApplicationController
  respond_to :json

  def create
    @vendor = Vendor.create(permitted_params)
    redirect_to vendor_path(@vendor)
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
