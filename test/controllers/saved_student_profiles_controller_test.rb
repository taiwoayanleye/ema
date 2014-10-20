require 'test_helper'

class SavedStudentProfilesControllerTest < ActionController::TestCase
  setup do
    @saved_student_profile = saved_student_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_student_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_student_profile" do
    assert_difference('SavedStudentProfile.count') do
      post :create, saved_student_profile: { school_text: @saved_student_profile.school_text, skill_text: @saved_student_profile.skill_text, year_text: @saved_student_profile.year_text }
    end

    assert_redirected_to saved_student_profile_path(assigns(:saved_student_profile))
  end

  test "should show saved_student_profile" do
    get :show, id: @saved_student_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saved_student_profile
    assert_response :success
  end

  test "should update saved_student_profile" do
    patch :update, id: @saved_student_profile, saved_student_profile: { school_text: @saved_student_profile.school_text, skill_text: @saved_student_profile.skill_text, year_text: @saved_student_profile.year_text }
    assert_redirected_to saved_student_profile_path(assigns(:saved_student_profile))
  end

  test "should destroy saved_student_profile" do
    assert_difference('SavedStudentProfile.count', -1) do
      delete :destroy, id: @saved_student_profile
    end

    assert_redirected_to saved_student_profiles_path
  end
end
