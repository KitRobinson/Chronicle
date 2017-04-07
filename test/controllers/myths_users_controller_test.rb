require 'test_helper'

class MythsUsersControllerTest < ActionController::TestCase
  setup do
    @myths_user = myths_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:myths_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create myths_user" do
    assert_difference('MythsUser.count') do
      post :create, myths_user: { access_level: @myths_user.access_level, myth_id: @myths_user.myth_id, user_id: @myths_user.user_id }
    end

    assert_redirected_to myths_user_path(assigns(:myths_user))
  end

  test "should show myths_user" do
    get :show, id: @myths_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @myths_user
    assert_response :success
  end

  test "should update myths_user" do
    patch :update, id: @myths_user, myths_user: { access_level: @myths_user.access_level, myth_id: @myths_user.myth_id, user_id: @myths_user.user_id }
    assert_redirected_to myths_user_path(assigns(:myths_user))
  end

  test "should destroy myths_user" do
    assert_difference('MythsUser.count', -1) do
      delete :destroy, id: @myths_user
    end

    assert_redirected_to myths_users_path
  end
end
