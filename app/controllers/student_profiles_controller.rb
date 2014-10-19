class StudentProfilesController < ApplicationController
  before_action :set_student_profile, only: [:show, :edit, :update, :destroy]
  #make sure the user is logged in
  before_filter :authenticate_user!
  #keep user from accessing their profile if they haven't created it yet
  before_filter(:except => [:new, :create]) {|c| c.profile_redir}
  #keep user from accessing any method that isn't connected to their profile
  before_filter(:only =>[:edit, :new, :destroy, :create, :update]) {|c| c.deny_access(params[:id])}
  before_filter(:only=>[:index]) {|c| if c.get_profile_type == 'student'; c.deny_access(-1) end}

  # GET /student_profiles
  # GET /student_profiles.json
  def index
    @student_profiles = StudentProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_profiles }
    end
  end

  # GET /student_profiles/1
  # GET /student_profiles/1.json
  def show
    @student_profile = StudentProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_profile }
    end
  end

  # GET /student_profiles/new
  def new
    @student_profile = StudentProfile.new
  end

  # GET /student_profiles/1/edit
  def edit
    @student_profile = StudentProfile.find(params[:id])
  end

  # POST /student_profiles
  # POST /student_profiles.json
  def create
    # @student_profile = StudentProfile.new(params[:student_profile])
    @student_profile = StudentProfile.new(student_profile_params)
    @cur_user = current_user
    @student_profile.user_id = @cur_user.id
    @student_profile.id = @cur_user.id
    # @student_profile.email = @cur_user.email

    respond_to do |format|
      if @student_profile.save
        format.html { redirect_to @student_profile, notice: 'Student profile was successfully created.' }
        format.json { render :show, status: :created, location: @student_profile }
      else
        format.html { render :new }
        format.json { render json: @student_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_profiles/1
  # PATCH/PUT /student_profiles/1.json
  def update
    @student_profile = StudentProfile.find(params[:id])

    respond_to do |format|
      if @student_profile.update(student_profile_params)
        format.html { redirect_to @student_profile, notice: 'Student profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_profile }
      else
        format.html { render :edit }
        format.json { render json: @student_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_profiles/1
  # DELETE /student_profiles/1.json
  def destroy
    @student_profile = StudentProfile.find(params[:id])
    @student_profile.destroy
    
    respond_to do |format|
      format.html { redirect_to student_profiles_url, notice: 'Student profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_profile
      @student_profile = StudentProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_profile_params
      params.require(:student_profile).permit(:first_name, :last_name, :school, :expected_graduation, :school_year, :last_completed_degree, :residential_address, :major, :resume, :image, user_attributes: [ :id, :email, :password, :user_type ])
    end
end
