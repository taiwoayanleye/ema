class CompanyProfilesController < ApplicationController
  #make sure the user is logged in
  before_filter :authenticate_user!, :get_user
  #keep user from accessing thier profile if they haven't created it yet
  before_filter(:except => [:new, :create]) { |c| c.profile_redir }
  #keep user from accessing any method that isn't connected to thier profile
  before_filter(:only => [:edit, :new, :destroy, :create, :update]) { |c| c.deny_acces(params[:id])}
  # redirect company if they haven't been verified
  # before_filter :verified?, :except => [:show, :edit, :update]
  
  # GET /company_profiles
  # GET /company_profiles.json
  def index
    @company_profiles = CompanyProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_profiles }
    end
  end

  # GET /company_profiles/1
  # GET /company_profiles/1.json
  def show
    @company_profile = CompanyProfile.find(params[:id])
    @jobs = @company_profile.job_postings
    # @company_profile = current_user

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @company_profile }
    end
  end

  # GET /company_profiles/new
  # GET /company_profiles/new.json
  def new
    @company_profile = CompanyProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_profile }
    end
  end

  # GET /company_profiles/1/edit
  def edit
    @company_profile = CompanyProfile.find(params[:id])
  end

  # POST /company_profiles
  # POST /company_profiles.json
  def create
    @company_profile = CompanyProfile.new(company_profile_params)
    # @company_profile = CompanyProfile.new(params[:company_profile])
    @cur_user = current_user
    @company_profile.user_id = @cur_user.id
    @company_profile.id = @cur_user.id
    # @company_profile.email = @cur_user.email

    respond_to do |format|
      if @company_profile.save
        format.html { redirect_to company_profile_url(@company_profile), notice: 'Company profile was successfully created.' }
        format.json { render json: @company_profile, status: :created, location: @company_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_profiles/1
  # PATCH/PUT /company_profiles/1.json
  def update
    @company_profile = CompanyProfile.find(params[:id])

    respond_to do |format|
      # if @company_profile.update_attributes(params[:company_profile])
      if @company_profile.update_attributes(company_profile_params)
        format.html { redirect_to company_profile_url(@company_profile), notice: 'Company profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_profiles/1
  # DELETE /company_profiles/1.json
  def destroy
    @company_profile = CompanyProfile.find(params[:id])
    @company_profile.destroy

    respond_to do |format|
      format.html { redirect_to company_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_profile
      # @company_profile = CompanyProfile.find(params[:company_profile])
      @company_profile = CompanyProfile.find(params[:id])
      # @company_profile = current_user.company_profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_profile_params
      params.require(:company_profile).permit(:company_name, :description, :company_type, :number_of_employees, :website, :location, :reg_code, :verified, :image, :user_id, user_attributes: [ :id, :email, :password ])

    end
end