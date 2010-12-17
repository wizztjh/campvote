require 'test_helper'

class BarcampSessionsControllerTest < ActionController::TestCase
  setup do
    @barcamp_session = barcamp_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barcamp_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barcamp_session" do
    assert_difference('BarcampSession.count') do
      post :create, :barcamp_session => @barcamp_session.attributes
    end

    assert_redirected_to barcamp_session_path(assigns(:barcamp_session))
  end

  test "should show barcamp_session" do
    get :show, :id => @barcamp_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @barcamp_session.to_param
    assert_response :success
  end

  test "should update barcamp_session" do
    put :update, :id => @barcamp_session.to_param, :barcamp_session => @barcamp_session.attributes
    assert_redirected_to barcamp_session_path(assigns(:barcamp_session))
  end

  test "should destroy barcamp_session" do
    assert_difference('BarcampSession.count', -1) do
      delete :destroy, :id => @barcamp_session.to_param
    end

    assert_redirected_to barcamp_sessions_path
  end
end
