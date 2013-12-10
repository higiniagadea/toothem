require 'test_helper'

class EstadosTratamientosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estados_tratamientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_tratamiento" do
    assert_difference('EstadoTratamiento.count') do
      post :create, :estado_tratamiento => { }
    end

    assert_redirected_to estado_tratamiento_path(assigns(:estado_tratamiento))
  end

  test "should show estado_tratamiento" do
    get :show, :id => estados_tratamientos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => estados_tratamientos(:one).to_param
    assert_response :success
  end

  test "should update estado_tratamiento" do
    put :update, :id => estados_tratamientos(:one).to_param, :estado_tratamiento => { }
    assert_redirected_to estado_tratamiento_path(assigns(:estado_tratamiento))
  end

  test "should destroy estado_tratamiento" do
    assert_difference('EstadoTratamiento.count', -1) do
      delete :destroy, :id => estados_tratamientos(:one).to_param
    end

    assert_redirected_to estados_tratamientos_path
  end
end
