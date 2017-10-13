require 'test_helper'

class WhatToKnowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @what_to_know = what_to_knows(:one)
  end

  test "should get index" do
    get what_to_knows_url
    assert_response :success
  end

  test "should get new" do
    get new_what_to_know_url
    assert_response :success
  end

  test "should create what_to_know" do
    assert_difference('WhatToKnow.count') do
      post what_to_knows_url, params: { what_to_know: { body: @what_to_know.body, date: @what_to_know.date, managment_id: @what_to_know.managment_id, title: @what_to_know.title } }
    end

    assert_redirected_to what_to_know_url(WhatToKnow.last)
  end

  test "should show what_to_know" do
    get what_to_know_url(@what_to_know)
    assert_response :success
  end

  test "should get edit" do
    get edit_what_to_know_url(@what_to_know)
    assert_response :success
  end

  test "should update what_to_know" do
    patch what_to_know_url(@what_to_know), params: { what_to_know: { body: @what_to_know.body, date: @what_to_know.date, managment_id: @what_to_know.managment_id, title: @what_to_know.title } }
    assert_redirected_to what_to_know_url(@what_to_know)
  end

  test "should destroy what_to_know" do
    assert_difference('WhatToKnow.count', -1) do
      delete what_to_know_url(@what_to_know)
    end

    assert_redirected_to what_to_knows_url
  end
end
