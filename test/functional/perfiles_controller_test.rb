require 'test_helper'

class PerfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perfil" do
    assert_difference('Perfil.count') do
      post :create, :perfil => { }
    end

    assert_redirected_to perfil_path(assigns(:perfil))
  end

  test "should show perfil" do
    get :show, :id => perfiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => perfiles(:one).to_param
    assert_response :success
  end

  test "should update perfil" do
    put :update, :id => perfiles(:one).to_param, :perfil => { }
    assert_redirected_to perfil_path(assigns(:perfil))
  end

  test "should destroy perfil" do
    assert_difference('Perfil.count', -1) do
      delete :destroy, :id => perfiles(:one).to_param
    end

    assert_redirected_to perfiles_path
  end
end
