require 'test_helper'

class PrestacionesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prestaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prestacion" do
    assert_difference('Prestacion.count') do
      post :create, :prestacion => { }
    end

    assert_redirected_to prestacion_path(assigns(:prestacion))
  end

  test "should show prestacion" do
    get :show, :id => prestaciones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prestaciones(:one).to_param
    assert_response :success
  end

  test "should update prestacion" do
    put :update, :id => prestaciones(:one).to_param, :prestacion => { }
    assert_redirected_to prestacion_path(assigns(:prestacion))
  end

  test "should destroy prestacion" do
    assert_difference('Prestacion.count', -1) do
      delete :destroy, :id => prestaciones(:one).to_param
    end

    assert_redirected_to prestaciones_path
  end
end
