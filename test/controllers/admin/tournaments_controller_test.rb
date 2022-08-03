require "test_helper"

class Admin::TournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tournaments_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_tournaments_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_tournaments_edit_url
    assert_response :success
  end
end
