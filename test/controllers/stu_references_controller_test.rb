require 'test_helper'

class StuReferencesControllerTest < ActionController::TestCase
  setup do
    @stu_reference = stu_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stu_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stu_reference" do
    assert_difference('StuReference.count') do
      post :create, stu_reference: { email: @stu_reference.email, name: @stu_reference.name, phone: @stu_reference.phone, relationship: @stu_reference.relationship }
    end

    assert_redirected_to stu_reference_path(assigns(:stu_reference))
  end

  test "should show stu_reference" do
    get :show, id: @stu_reference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stu_reference
    assert_response :success
  end

  test "should update stu_reference" do
    patch :update, id: @stu_reference, stu_reference: { email: @stu_reference.email, name: @stu_reference.name, phone: @stu_reference.phone, relationship: @stu_reference.relationship }
    assert_redirected_to stu_reference_path(assigns(:stu_reference))
  end

  test "should destroy stu_reference" do
    assert_difference('StuReference.count', -1) do
      delete :destroy, id: @stu_reference
    end

    assert_redirected_to stu_references_path
  end
end
