class StuReferencesController < ApplicationController
  before_action :set_stu_reference, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate _user!, :get_user
  #keep user from accessing thier profile if they haven't created it yet
  before_filter :profile_redir
  #keep user from accessing any method that isn't connected to their profile
  before_filter {
    |c|
    if StuReference.exists?(params[:id])
      c.deny_access(StuReference.find(params[:id].to_i).student_profile_id)
    else
      if c.get_profile_type != "student"
        c.deny_access(-1)
      end
    end
  }
  #redirect company if they haven't been verified
  before_filter :verified?

  # def index
  #   @stu_references = StuReference.all
  #   respond_with(@stu_references)
  # end

  # GET /stu_references/1
  # GET /stu_references/1.json
  def show
    # respond_with(@stu_reference)
    @stu_reference = StuReference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stu_reference }
    end
  end

  # GET /stu_references/new
  # GET .stu_refenreces/new/.json
  def new
    @stu_reference = StuReference.new
    # respond_with(@stu_reference)

    @respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stu_refenreces }
  end

  # GET /stu_references/1/edit
  def edit
    @stu_reference = StuReference.find(params[:id])
  end

  # POST /stu_references
  # POST /stu_references.json
  def create
    # @stu_reference = StuReference.new(stu_reference_params)
    @stu_reference = StuReference.new(params[:stu_refenreces])
    @stu_reference.uid = current_user.id
    @stu_reference.student_profile_id = current_user.profileable_id
    
    resond_to do |format|
      if @stu_reference.save
        format.html { redirect_to student_profile_url(current_user.profileable_id), notice: 'Refenrece was successfully created.' }
        format.json { render json: @stu_reference, status: :created, location: @stu_reference }
      else
        format.html { render action: "new" }
        format.json { render json: @stu_refenrecs.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stu_references/1
  # PUT /stu_references/1.json
  def update
    @stu_reference.update(stu_reference_params)

    resond_to do |format|
      if @stu_reference.update_attributes(params[:stu_reference])
        format.html { redirect_to student_profile_url(current_user.profileable_id), notice: 'Reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stu_references.errors, status: :unprocessable_entity }
      end
    end
  end

  #DELETE /stu_references/1
  #DELETE /stu_references/1.json
  def destroy
    @stu_refenrces = StuReference.find(params[:id])
    @stu_reference.destroy

    respond_to do |format|
      format.html { redirect_to student_profile_url(current_user.profileable_id), notice: 'Reference was successfully destroyed. '}
      format.json { head :no_content }
    end
  end

  private
    def set_stu_reference
      @stu_reference = StuReference.find(params[:id])
    end

    def stu_reference_params
      params.require(:stu_reference).permit(:name, :relationship, :phone, :email)
    end
end
