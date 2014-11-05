class StuCertificationsController < ApplicationController
  before_action :set_stu_certification, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, :get_user

  #GET /stu_certifications
  #GET /stu_certifications.json
  def index
    @stu_certifications = StuCertification.all
  end

  #GET /stu_certifications/1
  #GET /stu_certifications/1.json
  # def show
  #   stu_certification = StuCertification.find(params[:id])

  #   respond_to do |format|
  #     format.html #show.html
  #     format.json { render json: @stu_certification }
  #   end
  # end

  #GET /stu_certifications/new
  #GET /stu_certifications/new.json
  def new
    @stu_certification = StuCertification.new

    respond_to do |format|
      format.html #show html
      format.json {render json: @stu_interest }
    end
  end

  # GET /stu_interests/1/edit
  def edit
    @stu_certification = StuCertification.find(params[:id])
  end

  #POST /stu_interests/new
  #POST /stu_interests/new.json
  def create
    @stu_certification = StuCertification.new(stu_certification_params)
    @stu_certification.user_id = current_user.id
    @stu_certification.student_profile_id = current_user.profileable_id
    if @stu_certification.save
      redirect_to student_profile_url(current_user.profileable_id), notice: 'Certification was successfully saved.'
    else
      render :new
    end
  end

  #PATCH/PUT /stu_certifications/1.json
  def update
    @stu_certification = StuCertification.find(params[:id])

    respond_to do |format|
      if @stu_certification.update_attributes(stu_certification_params)
        format.html { render_to student_profile_url(current_user.profileable_id), notice: 'Certification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stu_certification.errors, status: :unprocessable_enity }
      end
    end
  end

  def destroy
    @stu_certification = StuCertification.find(params[:id])
    @stu_certification.destroy

    respond_to do |format|
      format.html { redirect_to stu_certifications_url(@user), notice: 'Certification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stu_certification
      @stu_certification = StuCertification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stu_certification_params
      params.require(:stu_certification).permit(:description)
    end
end
