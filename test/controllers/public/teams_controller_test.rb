require "test_helper"

class Public::TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_teams_index_url
    assert_response :success
  end

  test "should get show" do
    get public_teams_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_teams_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_teams_new_url
    assert_response :success
  end
end
