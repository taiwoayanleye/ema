class StuReferencesController < ApplicationController
  before_action :set_stu_reference, only: [:show, :edit, :update, :destroy]

  # before_filter :authenticate _user!, :get_user
  #keep user from accessing thier profile if they haven't created it yet
  # before_filter :profile_redir
  #keep user from accessing any method that isn't connected to their profile

  #redirect company if they haven't been verified
  # before_filter :verified?

  def index
    @stu_references = StuReference.all
    respond_with(@stu_references)
  end

  # GET /stu_references/1
  # GET /stu_references/1.json
  def show
    @stu_reference = StuReference.find(params[:id])
  end

  # GET /stu_references/new
  # GET .stu_refenreces/new/.json
  def new
    @stu_reference = StuReference.new
  end

  # GET /stu_references/1/edit
  def edit
    @stu_reference = StuReference.find(params[:id])
  end

  # POST /stu_references
  # POST /stu_references.json
  def create
    # @stu_reference = StuReference.new(stu_reference_params)
    @stu_reference = StuReference.new(stu_reference_params)
    @stu_reference.uid = current_user.id
    @stu_reference.student_profile_id = current_user.profileable_id
      if @stu_reference.save
        redirect_to student_profile_url(current_user.profileable_id), notice: 'Refenrece was successfully created.' 
      else
        render action: "new" 
     end
  end

  # PUT /stu_references/1
  # PUT /stu_references/1.json
  def update
    @stu_reference.update(stu_reference_params)
      if @stu_reference.update_attributes(stu_reference_params)
        redirect_to student_profile_url(current_user.profileable_id), notice: 'Reference was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  #DELETE /stu_references/1
  #DELETE /stu_references/1.json
  def destroy
    @stu_refenrces = StuReference.find(params[:id])
    @stu_reference.destroy
    redirect_to student_profile_url(current_user.profileable_id), notice: 'Reference was successfully destroyed. '
  end

  private
    def set_stu_reference
      @stu_reference = StuReference.find(params[:id])
    end

    def stu_reference_params
      params.require(:stu_reference).permit(:name, :relationship, :phone, :email)
    end
end
