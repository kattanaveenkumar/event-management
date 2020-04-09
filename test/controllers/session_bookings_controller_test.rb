require 'test_helper'

class SessionBookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get session_bookings_index_url
    assert_response :success
  end

  test "should get new" do
    get session_bookings_new_url
    assert_response :success
  end

  test "should get create" do
    get session_bookings_create_url
    assert_response :success
  end

  test "should get edit" do
    get session_bookings_edit_url
    assert_response :success
  end

  test "should get update" do
    get session_bookings_update_url
    assert_response :success
  end

  test "should get show" do
    get session_bookings_show_url
    assert_response :success
  end

  test "should get destroy" do
    get session_bookings_destroy_url
    assert_response :success
  end

end
