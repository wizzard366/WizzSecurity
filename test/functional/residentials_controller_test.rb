require 'test_helper'

class ResidentialsControllerTest < ActionController::TestCase
  setup do
    @residential = residentials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:residentials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create residential" do
    assert_difference('Residential.count') do
      post :create, residential: @residential.attributes
    end

    assert_redirected_to residential_path(assigns(:residential))
  end

  test "should show residential" do
    get :show, id: @residential.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @residential.to_param
    assert_response :success
  end

  test "should update residential" do
    put :update, id: @residential.to_param, residential: @residential.attributes
    assert_redirected_to residential_path(assigns(:residential))
  end

  test "should destroy residential" do
    assert_difference('Residential.count', -1) do
      delete :destroy, id: @residential.to_param
    end

    assert_redirected_to residentials_path
  end
end
