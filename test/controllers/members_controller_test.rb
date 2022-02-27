require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_index_url
    assert_response :success
  end

  test "should get update" do
    get members_update_url
    assert_response :success
  end
end
