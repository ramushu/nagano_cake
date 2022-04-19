require "test_helper"

class Admin::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_order_details_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_order_details_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_order_details_edit_url
    assert_response :success
  end
end
