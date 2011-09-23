require 'test_helper'

class ProfesionalesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesionales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesional" do
    assert_difference('Profesional.count') do
      post :create, :profesional => { }
    end

    assert_redirected_to profesional_path(assigns(:profesional))
  end

  test "should show profesional" do
    get :show, :id => profesionales(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => profesionales(:one).to_param
    assert_response :success
  end

  test "should update profesional" do
    put :update, :id => profesionales(:one).to_param, :profesional => { }
    assert_redirected_to profesional_path(assigns(:profesional))
  end

  test "should destroy profesional" do
    assert_difference('Profesional.count', -1) do
      delete :destroy, :id => profesionales(:one).to_param
    end

    assert_redirected_to profesionales_path
  end
end
