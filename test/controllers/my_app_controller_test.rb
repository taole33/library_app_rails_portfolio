require 'test_helper'

class MyAppControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get my_app_top_url
    assert_response :success
  end

end
