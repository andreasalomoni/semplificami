require 'test_helper'

class MarriageActsControllerTest < ActionController::TestCase
  setup do
    @marriage_act = marriage_acts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:marriage_acts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marriage_act" do
    assert_difference('MarriageAct.count') do
      post :create, marriage_act: { marriage_date: @marriage_act.marriage_date, number: @marriage_act.number, part: @marriage_act.part, registry: @marriage_act.registry, serie: @marriage_act.serie, year: @marriage_act.year }
    end

    assert_redirected_to marriage_act_path(assigns(:marriage_act))
  end

  test "should show marriage_act" do
    get :show, id: @marriage_act
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @marriage_act
    assert_response :success
  end

  test "should update marriage_act" do
    patch :update, id: @marriage_act, marriage_act: { marriage_date: @marriage_act.marriage_date, number: @marriage_act.number, part: @marriage_act.part, registry: @marriage_act.registry, serie: @marriage_act.serie, year: @marriage_act.year }
    assert_redirected_to marriage_act_path(assigns(:marriage_act))
  end

  test "should destroy marriage_act" do
    assert_difference('MarriageAct.count', -1) do
      delete :destroy, id: @marriage_act
    end

    assert_redirected_to marriage_acts_path
  end
end
