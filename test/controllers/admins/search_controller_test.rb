require 'test_helper'

class Admins::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get admins_search_search_url
    assert_response :success
  end

end
