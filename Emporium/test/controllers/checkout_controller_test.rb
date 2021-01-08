require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checkout_index_url
    assert_response :success
  end

  test "should get place_order" do
    get checkout_place_order_url
    assert_response :success
  end

  test "should get thank_you" do
    get checkout_thank_you_url
    assert_response :success
  end

end
