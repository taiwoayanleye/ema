class SavedStudentProfilesController < ApplicationController
  before_action :set_saved_student_profile, only: [:edit, :update, :destroy]

  before_filter :authenticate_user!
  #keep user from accessing thier profile if they haven't created it yet
  # #redirect company if they haven't been verified
  before_filter :verified?


  # def index
  #   @saved_student_profiles = SavedStudentProfile.all
  #   respond_with(@saved_student_profiles)
  # end

  # def show
  #   respond_with(@saved_student_profile)
  # end

  # def new
  #   @saved_student_profile = SavedStudentProfile.new
  #   respond_with(@saved_student_profile)
  # end

  # GET /saved_student_profiles/1/edit
  def edit
    @saved_student_profile = SavedStudentProfile.find(params[:id])
  end

  # def create
  #   @saved_student_profile = SavedStudentProfile.new(saved_student_profile_params)
  #   @saved_student_profile.save
  #   respond_with(@saved_student_profile)
  # end

  # PUT /saved_student_profiles/1
  # PUT /saved_student_profiles/1.json
  def update
    # @saved_student_profile.update(saved_student_profile_params)
    @saved_student_profile = SavedStudentProfile.find(params[:id])
    
    respond_to do |format|
      if @saved_student_profile.update_attributes(params[:saved_student_profile])
        format.html { redirect_to search_student_profiles_url, notice: 'Saved search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saved_student_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_student_profiles/1
  # DELETE /saved_student_profiles/1.json
  def destroy
    @saved_student_profile = SavedStudentProfile.find(params[:id])
    @saved_student_profile.destroy

    respond_to do |format|
      format.html {redirect_to search_student_profiles_url, notice: 'Saved search was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
    def set_saved_student_profile
      @saved_student_profile = SavedStudentProfile.find(params[:id])
    end

    def saved_student_profile_params
      params.require(:saved_student_profile).permit(:school_text, :year_text, :skill_text)
    end
end
