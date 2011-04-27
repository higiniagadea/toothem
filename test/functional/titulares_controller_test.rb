require 'test_helper'

class TitularesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:titulares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create titular" do
    assert_difference('Titular.count') do
      post :create, :titular => { }
    end

    assert_redirected_to titular_path(assigns(:titular))
  end

  test "should show titular" do
    get :show, :id => titulares(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => titulares(:one).to_param
    assert_response :success
  end

  test "should update titular" do
    put :update, :id => titulares(:one).to_param, :titular => { }
    assert_redirected_to titular_path(assigns(:titular))
  end

  test "should destroy titular" do
    assert_difference('Titular.count', -1) do
      delete :destroy, :id => titulares(:one).to_param
    end

    assert_redirected_to titulares_path
  end
end
