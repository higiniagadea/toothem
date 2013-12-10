require 'test_helper'

class HistoriasClinicasOrtodonciasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historias_clinicas_ortodoncias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historia_clinica_ortodoncia" do
    assert_difference('HistoriaClinicaOrtodoncia.count') do
      post :create, :historia_clinica_ortodoncia => { }
    end

    assert_redirected_to historia_clinica_ortodoncia_path(assigns(:historia_clinica_ortodoncia))
  end

  test "should show historia_clinica_ortodoncia" do
    get :show, :id => historias_clinicas_ortodoncias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => historias_clinicas_ortodoncias(:one).to_param
    assert_response :success
  end

  test "should update historia_clinica_ortodoncia" do
    put :update, :id => historias_clinicas_ortodoncias(:one).to_param, :historia_clinica_ortodoncia => { }
    assert_redirected_to historia_clinica_ortodoncia_path(assigns(:historia_clinica_ortodoncia))
  end

  test "should destroy historia_clinica_ortodoncia" do
    assert_difference('HistoriaClinicaOrtodoncia.count', -1) do
      delete :destroy, :id => historias_clinicas_ortodoncias(:one).to_param
    end

    assert_redirected_to historias_clinicas_ortodoncias_path
  end
end
