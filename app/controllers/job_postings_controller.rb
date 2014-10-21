class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

# GET /job_postings
# GET /job_postings.json
  before_filter :authenticate_user!, :get_user
  #keep user from accessing their profile if they haven't created it yet
  before_filter :profile_redir
  #keep user from accessing any method that isn't connected to their profile
  before_filter(:except =>[:index, :search]) {
      |c|
    if JobPosting.exists?(params[:id])
      c.deny_access(JobPosting.find(params[:id].to_i).company_profile_id)
    else
      if c.get_profile_type != "company"
        c.deny_access(-1)
      end
    end}
  #redirect company if they haven't been verified
  # before_filter :verified?

  def index
    @job_postings = JobPosting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_postings }
    end
  end

  def search()

    @job_postings_all = JobPosting.all
    # @saved = SavedJobPosting.find_all_by_student_profile_id(@user.id)
    @saved = SavedJobPosting.where(student_profile_id: @user.id)
    @return = []
    @pay = ['', 'Paid', 'Unpaid']

    #@params = params[:student_profile_id] = @user.id
    if params[:save_search]
      #@saved_job_posting = SavedJobPosting.new(params[:saved_job_posting])
      @saved_job_posting = SavedJobPosting.new
      #@saved_job_posting.student_profile_id = params[:student_profile_id]
      @saved_job_posting.student_profile_id = @user.id
      @saved_job_posting.position_text = params[:position_text]
      @saved_job_posting.description_text = params[:description_text]
      @saved_job_posting.paid_text = params[:paid_text]
      @saved_job_posting.requirements_text = params[:requirements_text]
      @saved_job_posting.culture = params[:culture]

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

    #   if params[:culture] != ''
    #     #culture is set but there are no search hits
    #     if @job_postings.nil?
    #       @job_postings_all.each do |profile|
    #         if CompanyProfile.find(profile.company_profile_id).qsort == params[:culture]
    #           @return.append(profile)
    #         end
    #       end
    #       #culture is set and there are search hits
    #     else
    #       @job_postings.each do |profile|
    #         if CompanyProfile.find(profile.company_profile_id).qsort == params[:culture]
    #           @return.append(profile)
    #         end
    #       end
    #     end
    #     #no culture is set
    #   else
    #     @return = @job_postings
    #   end
    # else
      #when the search page is initially visited, displays all of the job postings
      #@return = @job_postings_all
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
    # @job_posting.user_id = @user.id
    @job_posting.company_profile_id = current_user.id
    @job_posting.posted_on = Time.now

    respond_to do |format|
      if @job_posting.save
        format.html { redirect_to company_profiles_url(@user), notice: 'Job posting was successfully created.' }
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
