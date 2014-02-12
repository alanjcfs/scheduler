require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  test "post to Vendor creates a new vendor" do
    assert_difference('Vendor.count') do
      post :create, vendor: { name: "Joe the Surf Instructor" }
    end

    assert_response :success
    assert assigns(:vendor)
  end

  test "get vendor#show" do
    vendor = create(:vendor)

    get :show, {format: :json, id: vendor.id}
    body = JSON.parse(response.body)
    assert body['vendor'], "Response body must have 'vendor' attribute"
    assert body['vendor']['id'] == vendor.id, "Response body must have id attribute"
    assert_response :success
  end

  test "get vendors#index" do
    create(:vendor)

    get :index
    assert assigns(:vendors)
    body = JSON.parse(response.body)
    body.empty?.must_equal false
    body["vendors"].size.must_equal 1
  end
end
