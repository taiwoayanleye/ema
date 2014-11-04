class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @job_applications = JobApplication.all
    respond_with(@job_applications)
  end

  def show
    respond_with(@job_application)
  end

  def new
    @job_application = JobApplication.new
    respond_with(@job_application)
  end

  def edit
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.save
    respond_with(@job_application)
  end

  def update
    @job_application.update(job_application_params)
    respond_with(@job_application)
  end

  def destroy
    @job_application.destroy
    respond_with(@job_application)
  end

  private
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    def job_application_params
      params[:job_application]
    end
end
