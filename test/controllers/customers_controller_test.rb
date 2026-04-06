require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get customers_profile_url
    assert_response :success
  end

  test "should get update_profile" do
    get customers_update_profile_url
    assert_response :success
  end
end
