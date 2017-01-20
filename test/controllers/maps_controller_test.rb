require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  
  test "should get map-page" do
    get :main
    assert_response :success
  end

end
