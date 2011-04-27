require 'test_helper'

class PermisosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permisos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permiso" do
    assert_difference('Permiso.count') do
      post :create, :permiso => { }
    end

    assert_redirected_to permiso_path(assigns(:permiso))
  end

  test "should show permiso" do
    get :show, :id => permisos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => permisos(:one).to_param
    assert_response :success
  end

  test "should update permiso" do
    put :update, :id => permisos(:one).to_param, :permiso => { }
    assert_redirected_to permiso_path(assigns(:permiso))
  end

  test "should destroy permiso" do
    assert_difference('Permiso.count', -1) do
      delete :destroy, :id => permisos(:one).to_param
    end

    assert_redirected_to permisos_path
  end
end
