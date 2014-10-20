require 'test_helper'

class SavedJobPostingsControllerTest < ActionController::TestCase
  setup do
    @saved_job_posting = saved_job_postings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_job_postings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_job_posting" do
    assert_difference('SavedJobPosting.count') do
      post :create, saved_job_posting: { description_text: @saved_job_posting.description_text, paid_text: @saved_job_posting.paid_text, position_text: @saved_job_posting.position_text, requirements_text: @saved_job_posting.requirements_text }
    end

    assert_redirected_to saved_job_posting_path(assigns(:saved_job_posting))
  end

  test "should show saved_job_posting" do
    get :show, id: @saved_job_posting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saved_job_posting
    assert_response :success
  end

  test "should update saved_job_posting" do
    patch :update, id: @saved_job_posting, saved_job_posting: { description_text: @saved_job_posting.description_text, paid_text: @saved_job_posting.paid_text, position_text: @saved_job_posting.position_text, requirements_text: @saved_job_posting.requirements_text }
    assert_redirected_to saved_job_posting_path(assigns(:saved_job_posting))
  end

  test "should destroy saved_job_posting" do
    assert_difference('SavedJobPosting.count', -1) do
      delete :destroy, id: @saved_job_posting
    end

    assert_redirected_to saved_job_postings_path
  end
end
