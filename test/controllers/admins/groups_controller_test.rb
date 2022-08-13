require 'test_helper'

class Admins::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_groups_show_url
    assert_response :success
  end

end
