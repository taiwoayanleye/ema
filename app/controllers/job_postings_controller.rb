class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

# GET /job_postings
# GET /job_postings.json
  #keep user from accessing their profile if they haven't created it yet
  # before_action :authenticate_user!, :get_user
  # Stops current student users and non verified companies from accessing all actions except index and search
  before_action :allowed_user, except: [:index, :search] 

  def index
    @job_postings = JobPosting.all
    # @company = @job_postings.first.company_profile
    # @image = @company.image.url
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_postings }
    end
  end

  def search()

    @job_postings_all = JobPosting.all
      if user_signed_in?
        @saved = SavedJobPosting.where(student_profile_id: current_user.profileable_id)
      end
    @return = []
    @pay = ['', 'Paid', 'Unpaid']

    if params[:save_search]
      #@saved_job_posting = SavedJobPosting.new(params[:saved_job_posting])
      @saved_job_posting = SavedJobPosting.new
      #@saved_job_posting.student_profile_id = params[:student_profile_id]
      @saved_job_posting.student_profile_id = current_user.profileable_id
      @saved_job_posting.position_text = params[:position_text]
      @saved_job_posting.description_text = params[:description_text]
      @saved_job_posting.paid_text = params[:paid_text]
      @saved_job_posting.requirements_text = params[:requirements_text]

      respond_to do |format|
        if @saved_job_posting.save
          format.html { redirect_to :back, notice: 'Saved job posting was successfully created.' }
          format.json { render json: @saved_job_posting, status: :created, location: @saved_job_posting }
        else
          format.html { render action: "new" }
          format.json { render json: @saved_job_posting.errors, status: :unprocessable_entity }
        end
      end
    end

    if params[:position_text]
      if params[:position_text] != "" and params[:description_text] != "" and params[:paid_text] != "" and params[:requirements_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        match_term2 = "%" + params[:description_text] + "%"
        match_term3 = params[:paid_text]
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Position LIKE ? AND Job_description LIKE ? AND Job_paid = ? AND Job_requirements LIKE ?", match_term1, match_term2, match_term3, match_term4)
      elsif params[:position_text] != "" and params[:description_text] != "" and params[:paid_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        match_term2 = "%" + params[:description_text] + "%"
        match_term3 = params[:paid_text]
        @job_postings = JobPosting.where("Position LIKE ? AND Job_description LIKE ? AND Job_paid = ?", match_term1, match_term2, match_term3)
      elsif params[:position_text] != "" and params[:description_text] != "" and params[:requirements_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        match_term2 = "%" + params[:description_text] + "%"
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Position LIKE ? AND Job_description LIKE ? AND Job_requirements LIKE ?", match_term1, match_term2, match_term4)
      elsif params[:position_text] != "" and params[:paid_text] != "" and params[:requirements_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        match_term3 = params[:paid_text]
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Position LIKE ? AND Job_paid = ? AND Job_requirements LIKE ?", match_term1, match_term3, match_term4)
      elsif params[:description_text] != "" and params[:paid_text] != "" and params[:requirements_text] != ""
        match_term2 = "%" + params[:description_text] + "%"
        match_term3 = params[:paid_text]
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Job_description LIKE ? AND Job_paid LIKE ? AND Job_requirements LIKE ?", match_term2, match_term3, match_term4)
      elsif params[:position_text] != "" and params[:description_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        match_term2 = "%" + params[:description_text] + "%"
        @job_postings = JobPosting.where("Position LIKE ? AND Job_description LIKE ?", match_term1, match_term2)
      elsif params[:position_text] != "" and params[:paid_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        match_term3 = params[:paid_text]
        @job_postings = JobPosting.where("Position LIKE ? AND Job_paid = ?", match_term1, match_term3)
      elsif params[:position_text] != "" and params[:requirements_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Position LIKE ? AND Job_requirements LIKE ?", match_term1, match_term4)
      elsif params[:description_text] != "" and params[:paid_text] != ""
        match_term2 = "%" + params[:description_text] + "%"
        match_term3 = params[:paid_text]
        @job_postings = JobPosting.where("Job_description LIKE ? AND Job_paid = ?", match_term2, match_term3)
      elsif params[:description_text] != "" and params[:requirements_text] != ""
        match_term2 = "%" + params[:description_text] + "%"
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Job_description LIKE ? AND Job_requirements LIKE ?", match_term2, match_term4)
      elsif params[:paid_text] != "" and params[:requirements_text] != ""
        match_term3 = params[:paid_text]
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Job_paid = ? AND Job_requirements LIKE ?", match_term3, match_term4)
      elsif params[:position_text] != ""
        match_term1 = "%" + params[:position_text] + "%"
        @job_postings = JobPosting.where("Position LIKE ?", match_term1)
      elsif params[:description_text] != ""
        match_term2 = "%" + params[:description_text] + "%"
        @job_postings = JobPosting.where("Job_description LIKE ?", match_term2)
      elsif params[:paid_text] != ""
        match_term3 = params[:paid_text]
        @job_postings = JobPosting.where("Job_paid = ?", match_term3)
      elsif params[:requirements_text] != ""
        match_term4 = "%" + params[:requirements_text] + "%"
        @job_postings = JobPosting.where("Job_requirements LIKE ?", match_term4)
      end

      if @job_postings.nil?
      @job_postings_all.each do |profile|
          @return.append(profile)
        end
      else
          @job_postings.each do |profile|
          @return.append(profile)
        end
      end

    else
      #when the search page is initially visited, displays all of the job postings
      @return = @job_postings_all
    end
      @position_text = params[:position_text]
      @description_text = params[:description_text]
      @paid_text = params[:paid_text]
      @requirements_text = params[:requirements_text]
    end

  # GET /job_postings/1
  # GET /job_postings/1.json
  # Blocked by before action allowed user
  def show
    @job_posting = JobPosting.find(params[:id]).order("created_at DESC")

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @job_posting }
    end
  end

  # GET /job_postings/new
  # GET /job_postings/new.json
  # Blocked by before action allowed user
  def new
    @job_posting = JobPosting.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @job_posting }
    end
  end

  # POST /job_postings
  # POST /job_postings.json
  # Blocked by before action allowed user
  def edit
    @job_posting = JobPosting.find(params[:id])
  end

  # POST /job_postings
  # POST /job_postings.json
  # Blocked by before action allowed user
  def create
    # @job_posting = JobPosting.new(params[:job_posting])
    @job_posting = JobPosting.new(job_posting_params)
    # @job_posting.user_id = current_user.profileable_id
    @job_posting.company_profile_id = current_user.profileable_id
    # Same as rails created_at
    @job_posting.posted_on = Time.now

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to company_profiles_url(current_user.profileable_id), notice: 'Job posting was successfully created.' }
        format.json { render json: @job_posting, status: :created, location: @job_posting }
      else
        format.html { render action: "new" }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_postings/1
  # PUT /job_postings/1.json
  # Blocked by before action allowed user
  def update
    @job_posting = JobPosting.find(params[:id])

    respond_to do |format|
      if @job_posting.update_attributes(params[:job_posting])
        format.html { redirect_to company_profile_url(current_user.profileable_id), notice: 'Job posting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  # Blocked by before action allowed user
  def destroy
    @job_posting = JobPosting.find(params[:id])
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to company_profile_url(current_user.profileable_id), notice: 'Job posting was successfully deleted.' }
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

    def allowed_user
      redirect_to root_url, notice: "You shall not pass!" unless current_user.try(:user_type) === "company" && current_user.company_verified? === true
    end
end
