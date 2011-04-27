require 'test_helper'

class EstadosLaboralesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estados_laborales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estado_laboral" do
    assert_difference('EstadoLaboral.count') do
      post :create, :estado_laboral => { }
    end

    assert_redirected_to estado_laboral_path(assigns(:estado_laboral))
  end

  test "should show estado_laboral" do
    get :show, :id => estados_laborales(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => estados_laborales(:one).to_param
    assert_response :success
  end

  test "should update estado_laboral" do
    put :update, :id => estados_laborales(:one).to_param, :estado_laboral => { }
    assert_redirected_to estado_laboral_path(assigns(:estado_laboral))
  end

  test "should destroy estado_laboral" do
    assert_difference('EstadoLaboral.count', -1) do
      delete :destroy, :id => estados_laborales(:one).to_param
    end

    assert_redirected_to estados_laborales_path
  end
end
