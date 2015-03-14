require 'test_helper'

class ActivityLevelsControllerTest < ActionController::TestCase
  setup do
    @activity_level = activity_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_level" do
    assert_difference('ActivityLevel.count') do
      post :create, activity_level: {  }
    end

    assert_redirected_to activity_level_path(assigns(:activity_level))
  end

  test "should show activity_level" do
    get :show, id: @activity_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_level
    assert_response :success
  end

  test "should update activity_level" do
    patch :update, id: @activity_level, activity_level: {  }
    assert_redirected_to activity_level_path(assigns(:activity_level))
  end

  test "should destroy activity_level" do
    assert_difference('ActivityLevel.count', -1) do
      delete :destroy, id: @activity_level
    end

    assert_redirected_to activity_levels_path
  end
end
