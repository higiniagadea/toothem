require 'test_helper'

class TratamientosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tratamientos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tratamiento" do
    assert_difference('Tratamiento.count') do
      post :create, :tratamiento => { }
    end

    assert_redirected_to tratamiento_path(assigns(:tratamiento))
  end

  test "should show tratamiento" do
    get :show, :id => tratamientos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tratamientos(:one).to_param
    assert_response :success
  end

  test "should update tratamiento" do
    put :update, :id => tratamientos(:one).to_param, :tratamiento => { }
    assert_redirected_to tratamiento_path(assigns(:tratamiento))
  end

  test "should destroy tratamiento" do
    assert_difference('Tratamiento.count', -1) do
      delete :destroy, :id => tratamientos(:one).to_param
    end

    assert_redirected_to tratamientos_path
  end
end
