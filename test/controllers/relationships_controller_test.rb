require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  setup do
    @relationship = Relationship.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relationship" do
    assert_difference('Relationship.count') do
      post :create, relationship: { current_relationship: @relationship.current_relationship, expected_relationship: @relationship.expected_relationship, organization_one_id: @relationship.organization_one_id, organization_two_id: @relationship.organization_two_id }
    end

    assert_redirected_to relationship_path(assigns(:relationship))
  end

  test "should show relationship" do
    get :show, id: @relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relationship
    assert_response :success
  end

  test "should update relationship" do
    patch :update, id: @relationship, relationship: { current_relationship: @relationship.current_relationship, expected_relationship: @relationship.expected_relationship, organization_one_id: @relationship.organization_one_id, organization_two_id: @relationship.organization_two_id }
    assert_redirected_to relationship_path(assigns(:relationship))
  end

  test "should destroy relationship" do
    assert_difference('Relationship.count', -1) do
      delete :destroy, id: @relationship
    end

    assert_redirected_to relationships_path
  end
end
