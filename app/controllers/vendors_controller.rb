class VendorsController < ApplicationController
  respond_to :js

  def create
    @vendor = Vendor.create(permitted_params)
    redirect_to vendor_path(@vendor)
  end

  private
  def permitted_params
    params.require(:vendor).permit(:name)
  end
end
