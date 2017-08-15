require 'test_helper'

class WithdrawControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get withdraw_create_url
    assert_response :success
  end

  test "should get new" do
    get withdraw_new_url
    assert_response :success
  end

end
