require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  test "post to Vendor creates a new vendor" do
    assert_difference('Vendor.count') do
      post :create, vendor: { name: "Joe the Surf Instructor" }
    end

    assert_redirected_to vendor_path(assigns(:vendor))
  end
end
