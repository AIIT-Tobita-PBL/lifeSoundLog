require 'test_helper'

class LogViewsControllerTest < ActionController::TestCase
  setup do
    @log_view = log_views(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_views)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_view" do
    assert_difference('LogView.count') do
      post :create, log_view: { msg: @log_view.msg, user_id: @log_view.user_id }
    end

    assert_redirected_to log_view_path(assigns(:log_view))
  end

  test "should show log_view" do
    get :show, id: @log_view
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log_view
    assert_response :success
  end

  test "should update log_view" do
    patch :update, id: @log_view, log_view: { msg: @log_view.msg, user_id: @log_view.user_id }
    assert_redirected_to log_view_path(assigns(:log_view))
  end

  test "should destroy log_view" do
    assert_difference('LogView.count', -1) do
      delete :destroy, id: @log_view
    end

    assert_redirected_to log_views_path
  end
end
