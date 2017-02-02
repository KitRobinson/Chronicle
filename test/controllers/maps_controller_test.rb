require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  
  test "should not get map-page when logged out" do
    get :main
    assert_response 302
  end

  test "should get map-page when logged in" do
  	session[:user_id] = 1
  	get :main
  	assert_response :success
  end

end
