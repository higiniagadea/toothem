require 'test_helper'

class HistoriasClinicasGeneralesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historias_clinicas_generales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historia_clinica_general" do
    assert_difference('HistoriaClinicaGeneral.count') do
      post :create, :historia_clinica_general => { }
    end

    assert_redirected_to historia_clinica_general_path(assigns(:historia_clinica_general))
  end

  test "should show historia_clinica_general" do
    get :show, :id => historias_clinicas_generales(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => historias_clinicas_generales(:one).to_param
    assert_response :success
  end

  test "should update historia_clinica_general" do
    put :update, :id => historias_clinicas_generales(:one).to_param, :historia_clinica_general => { }
    assert_redirected_to historia_clinica_general_path(assigns(:historia_clinica_general))
  end

  test "should destroy historia_clinica_general" do
    assert_difference('HistoriaClinicaGeneral.count', -1) do
      delete :destroy, :id => historias_clinicas_generales(:one).to_param
    end

    assert_redirected_to historias_clinicas_generales_path
  end
end
