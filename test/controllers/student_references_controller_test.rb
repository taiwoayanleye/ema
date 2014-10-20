require 'test_helper'

class StudentReferencesControllerTest < ActionController::TestCase
  setup do
    @student_reference = student_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_reference" do
    assert_difference('StudentReference.count') do
      post :create, student_reference: { email: @student_reference.email, name: @student_reference.name, phone: @student_reference.phone, relationship: @student_reference.relationship }
    end

    assert_redirected_to student_reference_path(assigns(:student_reference))
  end

  test "should show student_reference" do
    get :show, id: @student_reference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_reference
    assert_response :success
  end

  test "should update student_reference" do
    patch :update, id: @student_reference, student_reference: { email: @student_reference.email, name: @student_reference.name, phone: @student_reference.phone, relationship: @student_reference.relationship }
    assert_redirected_to student_reference_path(assigns(:student_reference))
  end

  test "should destroy student_reference" do
    assert_difference('StudentReference.count', -1) do
      delete :destroy, id: @student_reference
    end

    assert_redirected_to student_references_path
  end
end
