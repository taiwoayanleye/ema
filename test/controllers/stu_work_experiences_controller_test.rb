require 'test_helper'

class StuWorkExperiencesControllerTest < ActionController::TestCase
  setup do
    @stu_work_experience = stu_work_experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stu_work_experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stu_work_experience" do
    assert_difference('StuWorkExperience.count') do
      post :create, stu_work_experience: { company: @stu_work_experience.company, description: @stu_work_experience.description, end_date: @stu_work_experience.end_date, position: @stu_work_experience.position, start_date: @stu_work_experience.start_date }
    end

    assert_redirected_to stu_work_experience_path(assigns(:stu_work_experience))
  end

  test "should show stu_work_experience" do
    get :show, id: @stu_work_experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stu_work_experience
    assert_response :success
  end

  test "should update stu_work_experience" do
    patch :update, id: @stu_work_experience, stu_work_experience: { company: @stu_work_experience.company, description: @stu_work_experience.description, end_date: @stu_work_experience.end_date, position: @stu_work_experience.position, start_date: @stu_work_experience.start_date }
    assert_redirected_to stu_work_experience_path(assigns(:stu_work_experience))
  end

  test "should destroy stu_work_experience" do
    assert_difference('StuWorkExperience.count', -1) do
      delete :destroy, id: @stu_work_experience
    end

    assert_redirected_to stu_work_experiences_path
  end
end
