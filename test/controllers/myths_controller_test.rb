require 'test_helper'

class MythsControllerTest < ActionController::TestCase
  setup do
    @myth = myths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:myths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create myth" do
    assert_difference('Myth.count') do
      post :create, myth: { content: @myth.content, myth_pic: @myth.myth_pic, title: @myth.title }
    end

    assert_redirected_to myth_path(assigns(:myth))
  end

  test "should show myth" do
    get :show, id: @myth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @myth
    assert_response :success
  end

  test "should update myth" do
    patch :update, id: @myth, myth: { content: @myth.content, myth_pic: @myth.myth_pic, title: @myth.title }
    assert_redirected_to myth_path(assigns(:myth))
  end

  test "should destroy myth" do
    assert_difference('Myth.count', -1) do
      delete :destroy, id: @myth
    end

    assert_redirected_to myths_path
  end
end
