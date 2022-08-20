require "test_helper"

class Public::TournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_tournaments_new_url
    assert_response :success
  end

  test "should get index" do
    get public_tournaments_index_url
    assert_response :success
  end

  test "should get show" do
    get public_tournaments_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_tournaments_edit_url
    assert_response :success
  end
end
