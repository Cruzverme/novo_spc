require 'test_helper'

class BillingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get billings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get billings_destroy_url
    assert_response :success
  end

  test "should get update" do
    get billings_update_url
    assert_response :success
  end

end
