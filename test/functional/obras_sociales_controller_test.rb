require 'test_helper'

class ObrasSocialesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obras_sociales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obra_social" do
    assert_difference('ObraSocial.count') do
      post :create, :obra_social => { }
    end

    assert_redirected_to obra_social_path(assigns(:obra_social))
  end

  test "should show obra_social" do
    get :show, :id => obras_sociales(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => obras_sociales(:one).to_param
    assert_response :success
  end

  test "should update obra_social" do
    put :update, :id => obras_sociales(:one).to_param, :obra_social => { }
    assert_redirected_to obra_social_path(assigns(:obra_social))
  end

  test "should destroy obra_social" do
    assert_difference('ObraSocial.count', -1) do
      delete :destroy, :id => obras_sociales(:one).to_param
    end

    assert_redirected_to obras_sociales_path
  end
end
