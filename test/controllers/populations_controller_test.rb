require 'test_helper'

class PopulationsControllerTest < ActionController::TestCase
  setup do
    @population = populations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:populations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create population" do
    assert_difference('Population.count') do
      post :create, population: { count: @population.count, loyalty: @population.loyalty, piety: @population.piety, province_id: @population.province_id, race_id: @population.race_id }
    end

    assert_redirected_to population_path(assigns(:population))
  end

  test "should show population" do
    get :show, id: @population
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @population
    assert_response :success
  end

  test "should update population" do
    patch :update, id: @population, population: { count: @population.count, loyalty: @population.loyalty, piety: @population.piety, province_id: @population.province_id, race_id: @population.race_id }
    assert_redirected_to population_path(assigns(:population))
  end

  test "should destroy population" do
    assert_difference('Population.count', -1) do
      delete :destroy, id: @population
    end

    assert_redirected_to populations_path
  end
end
