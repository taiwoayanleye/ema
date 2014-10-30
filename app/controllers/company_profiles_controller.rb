class CompanyProfilesController < ApplicationController
  before_action :set_company_profile, only: [:show, :edit, :update, :destroy]

  #make sure the user is logged in
  # before_action :authenticate_user!, :get_user
  before_action :user_type_authentication, except: [:index]
  #keep user from accessing thier profile if they haven't created it yet
  # before_action(:except => [:new, :create]) {|c| c.profile_redir}
  #keep user from accessing any method that isn't connected to thier profile
  # before_action(:only => [:new, :destroy, :create, :update]) { |c| c.deny_access(params[:id])}
  # redirect company if they haven't been verified
  # before_action :verified?, :only => [:index, :destroy]
  
  # GET /company_profiles
  # GET /company_profiles.json
  def index
    @company_profiles = CompanyProfile.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @company_profiles }
    # end
  end

  # GET /company_profiles/1
  # GET /company_profiles/1.json
  def show
    # @company_profile = current_user.profile
    @company_profile = CompanyProfile.where(user_id: params[:id]).first
    # @jobs = @company_profile.job_postings
    

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @company_profile }
    end
  end


  # GET /company_profiles/1/edit
  def edit
    @company_profile = current_user.profile
  end


  # PATCH/PUT /company_profiles/1
  # PATCH/PUT /company_profiles/1.json
  def update
    @company_profile = current_user.profile

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
    @company_profile = current_user.profile
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
      @company_profile = current_user.profile
      # @company_profile = current_user.company_profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_profile_params
      params.require(:company_profile).permit(:company_name, :description, :company_type, :number_of_employees, :website, :location, :reg_code, :verified, :image, :user_id, user_attributes: [ :id, :email, :password ])

    end

    def user_type_authentication
      unless current_user.try(:user_type) === "company"
        redirect_to root_path, notice: "Not allowed"
      end
    end
  end