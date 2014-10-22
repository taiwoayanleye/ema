class StudentProfilesController < ApplicationController
  before_action :set_student_profile, only: [:show, :edit, :update, :destroy]
  
  #make sure the user is logged in
  before_action :authenticate_user!, :get_user
  #keep user from accessing their profile if they haven't created it yet
  # before_filter(:except => [:new, :create]) { |c| c.profile_redir}
  #keep user from accessing any method that isn't connected to thier profile
  # before_filter(:only =>[:edit, :new, :destroy, :create, :update]) {|c| c.deny_access(params[:id])}
  # before_action(:only=>[:index]) {|c| if c.get_profile_type == 'student'; c.deny_access(-1) end}
  #redirect company if they haven't been verified
  # before_filter :verified?

  # GET /student_profiles
  # GET /student_profiles.json
  def index
    @student_profiles = StudentProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_profiles }
    end
  end

  def search
    @return = []
    @years = ['', 'First Year', 'Second Year', 'Third Year', 'Fourth Year', 'Final Year', 'N/A']

    @student_profiles_all = StudentProfile.all
    # @saved = SavedStudentProfile.find_all_by_company_profile_id(current_user.profileable_id)
    @saved = SavedStudentProfile.where(company_profile_id: current_user.profileable_id)

    if params[:save_search]
      @saved_student_profile = SavedStudentProfile.new
      @saved_student_profile.company_profile_id = current_user.profileable_id
      @saved_student_profile.school_text = params[:school_text]
      @saved_student_profile.year_text = params[:year_text]
      @saved_student_profile.skill_text = params[:skill_text]

      respond_to do |format|
        if @saved_student_profile.save
          format.html { redirect_to :back, notice: 'Saved student profile was successfully created.' }
          format.json { render json: @saved_student_profile, status: :created, location: @saved_student_profile }
        else
          format.html { render action: "new" }
          format.json { render json: @saved_student_profile.errors, status: :unprocessable_entity }
        end
      end
    end

    if params[:school_text]
      if params[:school_text] != "" and params[:year_text] != "" and params[:skill_text] != ""
        match_term1 = params[:school_text]
        match_term2 = params[:year_text]
        match_term3 = params[:skill_text]
        @student_profiles = StudentProfile.find_by_sql("SELECT * FROM Student_Profiles sp INNER JOIN skills s ON  sp.id = s.student_profile_id WHERE s.description LIKE '%" +
                                                           match_term3 + "%' AND sp.school LIKE '%" + match_term1 + "%' AND sp.school_year LIKE '%" + match_term2 + "%'" )
      elsif params[:school_text] != "" and params[:skill_text] != ""
        match_term1 =  params[:school_text]
        match_term2 =  params[:skill_text]
        @student_profiles = StudentProfile.find_by_sql("SELECT * FROM Student_Profiles sp INNER JOIN skills s ON  sp.id = s.student_profile_id WHERE s.description LIKE '%" +
                                                           match_term2 + "%' AND sp.School LIKE '%" + match_term1 + "%'")
      elsif params[:year_text] != "" and params[:skill_text] != ""
        match_term1 =  params[:year_text]
        match_term2 =  params[:skill_text]
        @student_profiles = StudentProfile.find_by_sql("SELECT * FROM Student_Profiles sp INNER JOIN skills s ON  sp.id = s.student_profile_id WHERE s.description LIKE '%" +
                                                           match_term2 + "%' AND sp.school_year LIKE '%" + match_term1 + "%'")
      elsif params[:year_text] != "" and params[:school_text] != ""
        match_term1 = "%" + params[:year_text] + "%"
        match_term2 = "%" + params[:school_text] + "%"
        @student_profiles = StudentProfile.where("School_year LIKE ? AND School LIKE ?", match_term1, match_term2)
      elsif params[:year_text] != ""
        match_term = "%" + params[:year_text] + "%"
        @student_profiles = StudentProfile.where("School_year LIKE ?", match_term)
      elsif params[:school_text] != ""
        match_term = "%" + params[:school_text] + "%"
        @student_profiles = StudentProfile.where("School LIKE ?", match_term)
      elsif params[:skill_text] != ""
        match_term1 = params[:skill_text]
        @student_profiles = StudentProfile.find_by_sql("SELECT * FROM Student_Profiles sp INNER JOIN skills s ON  sp.id = s.student_profile_id WHERE s.description LIKE '%" + match_term1 + "%'")
      end

      if params[:culture] != ''
        # culture is set but there are no search hits
      #   if @student_profiles.nil?
      #       @student_profiles_all.each do |profile|
      #         if profile.qsort == params[:culture]
      #           @return.append(profile)
      #         end
      #       end
      #   #culture is set and there are search hits
      #   else
      #     @student_profiles.each do |profile|
      #       if profile.qsort == params[:culture]
      #         @return.append(profile)
      #       end
      #     end
      #   end
      # #culture is not set
      # else
        @return = @student_profiles
      end
    else
      #when the search page is initially visited, display all interns
      @return = @student_profiles_all
    end
    @school_text = params[:school_text]
    @year_text = params[:year_text]
    @skill_text = params[:skill_text]
    @culture = params[:culture]

  end

  # GET /student_profiles/1
  # GET /student_profiles/1.json
  def show
    @student_profile = current_user.profile
    @skills = @student_profile.skills
    @work_histories = @student_profile.stu_work_experiences
    @references = @student_profile.stu_references

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @student_profile }
    # end
  end

  # GET /student_profiles/new
  def new
    @student_profile = StudentProfile.new

      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_profile }
    end
  end

  # GET /student_profiles/1/edit
  def edit
    @student_profile = current_user.profile
  end

  # PATCH/PUT /student_profiles/1
  # PATCH/PUT /student_profiles/1.json
  def update
    @student_profile = StudentProfile.find(params[:id])

    respond_to do |format|
      if @student_profile.update_attributes(student_profile_params)
        format.html { redirect_to student_profile_path(current_user.profileable_id), notice: 'Student profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_profile }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_profiles/1
  # DELETE /student_profiles/1.json
  def destroy
    @student_profile = current_user.profile
    @student_profile.destroy
    
    respond_to do |format|
      format.html { redirect_to student_profiles_url, notice: 'Student profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_profile
      @student_profile = current_user.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_profile_params
      params.require(:student_profile).permit(:first_name, :last_name, :school, :expected_graduation, :school_year, :last_completed_degree, :residential_address, :major, :resume, :image, user_attributes: [ :id, :email, :password, :user_type ])
    end
end
