class SavedStudentProfilesController < ApplicationController
  before_action :set_saved_student_profile, only: [:show, :edit, :update, :destroy]

  def index
    @saved_student_profiles = SavedStudentProfile.all
    respond_with(@saved_student_profiles)
  end

  def show
    respond_with(@saved_student_profile)
  end

  def new
    @saved_student_profile = SavedStudentProfile.new
    respond_with(@saved_student_profile)
  end

  def edit
  end

  def create
    @saved_student_profile = SavedStudentProfile.new(saved_student_profile_params)
    @saved_student_profile.save
    respond_with(@saved_student_profile)
  end

  def update
    @saved_student_profile.update(saved_student_profile_params)
    respond_with(@saved_student_profile)
  end

  def destroy
    @saved_student_profile.destroy
    respond_with(@saved_student_profile)
  end

  private
    def set_saved_student_profile
      @saved_student_profile = SavedStudentProfile.find(params[:id])
    end

    def saved_student_profile_params
      params.require(:saved_student_profile).permit(:school_text, :year_text, :skill_text)
    end
end
