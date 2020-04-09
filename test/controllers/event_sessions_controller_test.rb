require 'test_helper'

class EventSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_sessions_index_url
    assert_response :success
  end

  test "should get new" do
    get event_sessions_new_url
    assert_response :success
  end

  test "should get edit" do
    get event_sessions_edit_url
    assert_response :success
  end

  test "should get show" do
    get event_sessions_show_url
    assert_response :success
  end

  test "should get update" do
    get event_sessions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get event_sessions_destroy_url
    assert_response :success
  end

end
