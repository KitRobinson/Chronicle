require 'test_helper'

class UserConversationsControllerTest < ActionController::TestCase
  setup do
    @user_conversation = user_conversations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_conversations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_conversation" do
    assert_difference('UserConversation.count') do
      post :create, user_conversation: { conversation_id: @user_conversation.conversation_id, user_id: @user_conversation.user_id }
    end

    assert_redirected_to user_conversation_path(assigns(:user_conversation))
  end

  test "should show user_conversation" do
    get :show, id: @user_conversation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_conversation
    assert_response :success
  end

  test "should update user_conversation" do
    patch :update, id: @user_conversation, user_conversation: { conversation_id: @user_conversation.conversation_id, user_id: @user_conversation.user_id }
    assert_redirected_to user_conversation_path(assigns(:user_conversation))
  end

  test "should destroy user_conversation" do
    assert_difference('UserConversation.count', -1) do
      delete :destroy, id: @user_conversation
    end

    assert_redirected_to user_conversations_path
  end
end
