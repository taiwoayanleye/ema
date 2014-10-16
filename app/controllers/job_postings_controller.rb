class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

  def index
    @job_postings = JobPosting.all
    respond_with(@job_postings)
  end

  def show
    respond_with(@job_posting)
  end

  def new
    @job_posting = JobPosting.new
    respond_with(@job_posting)
  end

  def edit
  end

  def create
    @job_posting = JobPosting.new(job_posting_params)
    @job_posting.save
    respond_with(@job_posting)
  end

  def update
    @job_posting.update(job_posting_params)
    respond_with(@job_posting)
  end

  def destroy
    @job_posting.destroy
    respond_with(@job_posting)
  end

  private
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    def job_posting_params
      params.require(:job_posting).permit(:job_id, :position, :job_description, :job_start, :job_end, :posted_on, :position_time, :job, :job_requirements)
    end
end
