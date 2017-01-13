require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  setup do
    @actor = Actor.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actor" do
    assert_difference('Actor.count') do
      post :create, actor: { count: @actor.count, cunning: @actor.cunning, description: @actor.description, might: @actor.might, mood: @actor.mood, name: @actor.name, organization_id: @actor.organization_id, perception: @actor.perception, personality: @actor.personality, province_id: @actor.province_id, race_id: @actor.race_id, sagacity: @actor.sagacity, scale: @actor.scale, subtlety: @actor.subtlety, will: @actor.will }
    end

    assert_redirected_to actor_path(assigns(:actor))
  end

  test "should show actor" do
    get :show, id: @actor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actor
    assert_response :success
  end

  test "should update actor" do
    patch :update, id: @actor, actor: { count: @actor.count, cunning: @actor.cunning, description: @actor.description, might: @actor.might, mood: @actor.mood, name: @actor.name, organization_id: @actor.organization_id, perception: @actor.perception, personality: @actor.personality, province_id: @actor.province_id, race_id: @actor.race_id, sagacity: @actor.sagacity, scale: @actor.scale, subtlety: @actor.subtlety, will: @actor.will }
    assert_redirected_to actor_path(assigns(:actor))
  end

  test "should destroy actor" do
    assert_difference('Actor.count', -1) do
      delete :destroy, id: @actor
    end

    assert_redirected_to actors_path
  end
end
