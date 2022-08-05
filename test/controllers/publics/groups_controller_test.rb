require 'test_helper'

class Publics::GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_groups_show_url
    assert_response :success
  end

  test "should get index" do
    get publics_groups_index_url
    assert_response :success
  end

  test "should get edit" do
    get publics_groups_edit_url
    assert_response :success
  end

end
