class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

  def index
    @job_postings = JobPosting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_postings }
    end
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
    @job_posting = JobPosting.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @job_posting }
    end
  end

  # GET /job_postings/new
  # GET /job_postings/new.json
  def new
    @job_posting = JobPosting.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @job_posting }
    end
  end

  # POST /job_postings
  # POST /job_postings.json
  def edit
    @job_posting = JobPosting.find(params[:id])
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    # @job_posting = JobPosting.new(params[:job_posting])
    @job_posting = JobPosting.new(job_posting_params)
    @job_posting.user_id = @user.id
    @job_posting.company_profile_id = @user.id
    @job_posting.posted_on = Time.now

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to company_profile_url(@user), notice: 'Job posting was successfully created.' }
        format.json { render json: @job_posting, status: :created, location: @job_posting }
      else
        format.html { render action: "new" }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_postings/1
  # PUT /job_postings/1.json
  def update
    @job_posting = JobPosting.find(params[:id])

    respond_to do |format|
      if @job_posting.update_attributes(params[:job_posting])
        format.html { redirect_to company_profile_url(@user), notice: 'Job posting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting = JobPosting.find(params[:id])
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to company_profile_url(@user), notice: 'Job posting was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    def job_posting_params
      params.require(:job_posting).permit(:job_id, :position, :job_description, :job_start, :job_end, :posted_on, :position_time, :job_paid, :job_requirements)
    end
end
