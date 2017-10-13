require 'test_helper'

class Managment::BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get managment_blogs_index_url
    assert_response :success
  end

  test "should get show" do
    get managment_blogs_show_url
    assert_response :success
  end

  test "should get new" do
    get managment_blogs_new_url
    assert_response :success
  end

  test "should get edit" do
    get managment_blogs_edit_url
    assert_response :success
  end

end
