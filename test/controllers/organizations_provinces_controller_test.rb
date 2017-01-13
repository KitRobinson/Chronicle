require 'test_helper'

class OrganizationsProvincesControllerTest < ActionController::TestCase
  setup do
    @organizations_province = OrganizationsProvince.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations_provinces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organizations_province" do
    assert_difference('OrganizationsProvince.count') do
      post :create, organizations_province: { organization_id: @organizations_province.organization_id, province_id: @organizations_province.province_id }
    end

    assert_redirected_to organizations_province_path(assigns(:organizations_province))
  end

  test "should show organizations_province" do
    get :show, id: @organizations_province
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organizations_province
    assert_response :success
  end

  test "should update organizations_province" do
    patch :update, id: @organizations_province, organizations_province: { organization_id: @organizations_province.organization_id, province_id: @organizations_province.province_id }
    assert_redirected_to organizations_province_path(assigns(:organizations_province))
  end

  test "should destroy organizations_province" do
    assert_difference('OrganizationsProvince.count', -1) do
      delete :destroy, id: @organizations_province
    end

    assert_redirected_to organizations_provinces_path
  end
end
