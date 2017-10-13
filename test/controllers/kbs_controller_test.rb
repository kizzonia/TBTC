require 'test_helper'

class KbsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kbs_index_url
    assert_response :success
  end

  test "should get show" do
    get kbs_show_url
    assert_response :success
  end

end
