require 'test_helper'

class JobPostingsControllerTest < ActionController::TestCase
  setup do
    @job_posting = job_postings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_postings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_posting" do
    assert_difference('JobPosting.count') do
      post :create, job_posting: { job: @job_posting.job, job_description: @job_posting.job_description, job_end: @job_posting.job_end, job_id: @job_posting.job_id, job_requirements: @job_posting.job_requirements, job_start: @job_posting.job_start, position: @job_posting.position, position_time: @job_posting.position_time, posted_on: @job_posting.posted_on }
    end

    assert_redirected_to job_posting_path(assigns(:job_posting))
  end

  test "should show job_posting" do
    get :show, id: @job_posting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_posting
    assert_response :success
  end

  test "should update job_posting" do
    patch :update, id: @job_posting, job_posting: { job: @job_posting.job, job_description: @job_posting.job_description, job_end: @job_posting.job_end, job_id: @job_posting.job_id, job_requirements: @job_posting.job_requirements, job_start: @job_posting.job_start, position: @job_posting.position, position_time: @job_posting.position_time, posted_on: @job_posting.posted_on }
    assert_redirected_to job_posting_path(assigns(:job_posting))
  end

  test "should destroy job_posting" do
    assert_difference('JobPosting.count', -1) do
      delete :destroy, id: @job_posting
    end

    assert_redirected_to job_postings_path
  end
end
