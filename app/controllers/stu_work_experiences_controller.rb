class StuWorkExperiencesController < ApplicationController
  before_action :set_stu_work_experience, only: [:show, :edit, :update, :destroy]

  # GET /stu_work_experiences
  # GET /stu_work_experiences.json
  def index
    @stu_work_experiences = StuWorkExperience.all
  end

  # GET /stu_work_experiences/1
  # GET /stu_work_experiences/1.json
  def show
  end

  # GET /stu_work_experiences/new
  def new
    @stu_work_experience = StuWorkExperience.new
  end

  # GET /stu_work_experiences/1/edit
  def edit
  end

  # POST /stu_work_experiences
  # POST /stu_work_experiences.json
  def create
    @stu_work_experience = StuWorkExperience.new(stu_work_experience_params)

    respond_to do |format|
      if @stu_work_experience.save
        format.html { redirect_to @stu_work_experience, notice: 'Stu work experience was successfully created.' }
        format.json { render :show, status: :created, location: @stu_work_experience }
      else
        format.html { render :new }
        format.json { render json: @stu_work_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stu_work_experiences/1
  # PATCH/PUT /stu_work_experiences/1.json
  def update
    respond_to do |format|
      if @stu_work_experience.update(stu_work_experience_params)
        format.html { redirect_to @stu_work_experience, notice: 'Stu work experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @stu_work_experience }
      else
        format.html { render :edit }
        format.json { render json: @stu_work_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stu_work_experiences/1
  # DELETE /stu_work_experiences/1.json
  def destroy
    @stu_work_experience.destroy
    respond_to do |format|
      format.html { redirect_to stu_work_experiences_url, notice: 'Stu work experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stu_work_experience
      @stu_work_experience = StuWorkExperience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stu_work_experience_params
      params.require(:stu_work_experience).permit(:company, :position, :start_date, :end_date, :description)
    end
end
