require 'test_helper'

class AttitudesControllerTest < ActionController::TestCase
  setup do
    @attitude = Attitude.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attitudes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attitude" do
    assert_difference('Attitude.count') do
      post :create, attitude: { desired_status: @attitude.desired_status, organization_id: @attitude.organization_id, target_id: @attitude.target_id }
    end

    assert_redirected_to attitude_path(assigns(:attitude))
  end

  test "should show attitude" do
    get :show, id: @attitude
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attitude
    assert_response :success
  end

  test "should update attitude" do
    patch :update, id: @attitude, attitude: { desired_status: @attitude.desired_status, organization_id: @attitude.organization_id, target_id: @attitude.target_id }
    assert_redirected_to attitude_path(assigns(:attitude))
  end

  test "should destroy attitude" do
    assert_difference('Attitude.count', -1) do
      delete :destroy, id: @attitude
    end

    assert_redirected_to attitudes_path
  end
end
