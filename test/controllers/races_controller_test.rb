require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  setup do
    @race = Race.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:races)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create race" do
    assert_difference('Race.count') do
      post :create, race: { cunning: @race.cunning, description: @race.description, fecundity: @race.fecundity, longevity: @race.longevity, might: @race.might, name: @race.name, perception: @race.perception, sagacity: @race.sagacity, scale: @race.scale, subtlety: @race.subtlety, will: @race.will }
    end

    assert_redirected_to race_path(assigns(:race))
  end

  test "should show race" do
    get :show, id: @race
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @race
    assert_response :success
  end

  test "should update race" do
    patch :update, id: @race, race: { cunning: @race.cunning, description: @race.description, fecundity: @race.fecundity, longevity: @race.longevity, might: @race.might, name: @race.name, perception: @race.perception, sagacity: @race.sagacity, scale: @race.scale, subtlety: @race.subtlety, will: @race.will }
    assert_redirected_to race_path(assigns(:race))
  end

  test "should destroy race" do
    assert_difference('Race.count', -1) do
      delete :destroy, id: @race
    end

    assert_redirected_to races_path
  end
end
