require 'test_helper'

class KnotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knote" do
    assert_difference('Knote.count') do
      post :create, :knote => { }
    end

    assert_redirected_to knote_path(assigns(:knote))
  end

  test "should show knote" do
    get :show, :id => knotes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => knotes(:one).to_param
    assert_response :success
  end

  test "should update knote" do
    put :update, :id => knotes(:one).to_param, :knote => { }
    assert_redirected_to knote_path(assigns(:knote))
  end

  test "should destroy knote" do
    assert_difference('Knote.count', -1) do
      delete :destroy, :id => knotes(:one).to_param
    end

    assert_redirected_to knotes_path
  end
end
