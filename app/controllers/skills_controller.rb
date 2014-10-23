class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, :get_user
  #redirect company if they haven't been verified

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @skill = Skill.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/new
  # GET /skills/new/.json
  def new
    @skill = Skill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.json
  def create
    # @skill = Skill.new(skill_params)
    @skill = Skill.new(skill_params)
    @skill.user_id = current_user.id
    @skill.student_profile_id = current_user.profileable_id
      if @skill.save
        redirect_to @skill, notice: 'Skill was successfully created.' 
      else
        render :new 
      end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      # if @skill.update(skill_params)
      if @skill.update_attributes(skill_params)
        format.html { redirect_to student_profile_url(current_user.profileable_id), notice: 'Skill was successfully updated.' }
        format.json { head :no_content }
        # format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url(@user), notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:description)
    end
end
