class StuInterestsController < ApplicationController
  before_action :set_stu_interest, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, :get_user

  # GET /stu_interests
  # GET /stu_interests.json 
  def index
    @stu_interests = StuInterest.all
  end

  # GET /stu_interests/1
  # GET /stu_interests/1.json
  # def show
  #   @stu_interest = StuInterest.find(params[:id])

  #   respond_to do |format|
  #     format.html #show html
  #     format.json {render json: @stu_interest }
  #   end
  # end

  # GET /stu_interests/new
  # GET /stu_interests/new.json
  def new
    @stu_interest = StuInterest.new

    respond_to do |format|
      format.html #show html
      format.json {render json: @stu_interest }
    end
  end

  # GET /stu_interests/1/edit
  def edit
    @stu_interest = StuInterest.find(params[:id])
  end

  # POST /stu_interests/new
  # POST /stu_interests/new/.json
  def create
    @stu_interest = StuInterest.new(stu_interest_params)
    @stu_interest.user_id = current_user.id
    @stu_interest.student_profile_id = current_user.profileable_id
      if @stu_interest.save
        redirect_to student_profile_url(current_user.profileable_id), notice: 'Interest was successfully created.' 
      else
        render :new 
      end
  end
  
  # PATCH/PUT /stu_interests/1
  # PATCH/PUT /stu_interests/1.json
  def update  
    @stu_interest = StuInterest.find(params[:id])

    respond_to do |format|
      if @stu_interest.update_attributes(stu_interest_params)
        format.html { redirect_to student_profile_url(current_user.profileable_id), notice: 'Interest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stu_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stu_interests/1
  # DELETE /stu_interests/1.json  
  def destroy
    @stu_interest = StuInterest.find(params[:id])
    @stu_interest.destroy

    respond_to do |format|
      format.html { redirect_to stu_interests_url(@user), notice: 'Interest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stu_interest
      @stu_interest = StuInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stu_interest_params
      params.require(:stu_interest).permit(:description)
    end
end
