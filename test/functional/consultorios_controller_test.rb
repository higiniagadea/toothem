require 'test_helper'

class ConsultoriosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consultorios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consultorio" do
    assert_difference('Consultorio.count') do
      post :create, :consultorio => { }
    end

    assert_redirected_to consultorio_path(assigns(:consultorio))
  end

  test "should show consultorio" do
    get :show, :id => consultorios(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => consultorios(:one).to_param
    assert_response :success
  end

  test "should update consultorio" do
    put :update, :id => consultorios(:one).to_param, :consultorio => { }
    assert_redirected_to consultorio_path(assigns(:consultorio))
  end

  test "should destroy consultorio" do
    assert_difference('Consultorio.count', -1) do
      delete :destroy, :id => consultorios(:one).to_param
    end

    assert_redirected_to consultorios_path
  end
end
