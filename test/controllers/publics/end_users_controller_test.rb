require 'test_helper'

class Publics::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get publics_end_users_edit_url
    assert_response :success
  end

end
