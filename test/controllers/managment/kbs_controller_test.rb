require 'test_helper'

class Managment::KbsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get managment_kbs_index_url
    assert_response :success
  end

  test "should get edit" do
    get managment_kbs_edit_url
    assert_response :success
  end

  test "should get new" do
    get managment_kbs_new_url
    assert_response :success
  end

end
