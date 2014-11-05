class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def offers
    if current_user.user_type == 'company'
      @job_applications = JobApplication.all.where(company_profile: current_user.profile).order("created_at DESC")
    end
  end

  def applicants
    if current_user.user_type == 'student'
      @job_applications = JobApplication.all.where(student_profile: current_user.profile).order("created_at DESC")
    end
  end

  def new
    @job_application = JobApplication.new
    @job_posting = JobPosting.find(params[:job_posting_id])
    # @job_posting = JobPosting.where(id: params[:id])
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_posting = JobPosting.find(params[:job_posting_id])
    # @job_posting = JobPosting.where(id: params[:job_posting_id])
    @company_profile = @job_posting.company_profile

    @job_application.job_posting_id = @job_posting.id
    @job_application.student_profile_id = current_user.id
    @job_application.company_profile_id = @company_profile.id
    # @company_profile.id 

    respond_to do |format|
      if @job_application.save
        format.html {redirect_to root_url, notice: "Thanks for applying!" }
        format.json {render action: 'show', status: :created, location: @job_application}
      else
        format.html {render action: 'new'}
        format.json {render json: @job_application.errors, status: :unprocessable_entity}
      end
    end
  end

  # def destroy
  #   @job_application.destroy
  #   respond_with(@job_application)
  # end

  private
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def job_application_params
      params[:job_application]
    end
end
