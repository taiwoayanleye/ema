require 'test_helper'

class StuInterestsControllerTest < ActionController::TestCase
  setup do
    @stu_interest = stu_interests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stu_interests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stu_interest" do
    assert_difference('StuInterest.count') do
      post :create, stu_interest: { description: @stu_interest.description }
    end

    assert_redirected_to stu_interest_path(assigns(:stu_interest))
  end

  test "should show stu_interest" do
    get :show, id: @stu_interest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stu_interest
    assert_response :success
  end

  test "should update stu_interest" do
    patch :update, id: @stu_interest, stu_interest: { description: @stu_interest.description }
    assert_redirected_to stu_interest_path(assigns(:stu_interest))
  end

  test "should destroy stu_interest" do
    assert_difference('StuInterest.count', -1) do
      delete :destroy, id: @stu_interest
    end

    assert_redirected_to stu_interests_path
  end
end
