require 'test_helper'

class StuCertificationsControllerTest < ActionController::TestCase
  setup do
    @stu_certification = stu_certifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stu_certifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stu_certification" do
    assert_difference('StuCertification.count') do
      post :create, stu_certification: { description: @stu_certification.description }
    end

    assert_redirected_to stu_certification_path(assigns(:stu_certification))
  end

  test "should show stu_certification" do
    get :show, id: @stu_certification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stu_certification
    assert_response :success
  end

  test "should update stu_certification" do
    patch :update, id: @stu_certification, stu_certification: { description: @stu_certification.description }
    assert_redirected_to stu_certification_path(assigns(:stu_certification))
  end

  test "should destroy stu_certification" do
    assert_difference('StuCertification.count', -1) do
      delete :destroy, id: @stu_certification
    end

    assert_redirected_to stu_certifications_path
  end
end
