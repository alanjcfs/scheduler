require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  test "post to Vendor creates a new vendor" do
    assert_difference('Vendor.count') do
      post :create, vendor: { name: "Joe the Surf Instructor" }
    end

    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "get vendor#show" do
    get :show, {format: :json, id: vendors(:one).id}
    body = JSON.parse(response.body)
    assert body['id'] == vendors(:one).id
    assert_response :success
  end
end
