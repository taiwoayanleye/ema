class StuReferencesController < ApplicationController
  before_action :set_stu_reference, only: [:show, :edit, :update, :destroy]

  def index
    @stu_references = StuReference.all
    respond_with(@stu_references)
  end

  def show
    respond_with(@stu_reference)
  end

  def new
    @stu_reference = StuReference.new
    respond_with(@stu_reference)
  end

  def edit
  end

  def create
    @stu_reference = StuReference.new(stu_reference_params)
    @stu_reference.save
    respond_with(@stu_reference)
  end

  def update
    @stu_reference.update(stu_reference_params)
    respond_with(@stu_reference)
  end

  def destroy
    @stu_reference.destroy
    respond_with(@stu_reference)
  end

  private
    def set_stu_reference
      @stu_reference = StuReference.find(params[:id])
    end

    def stu_reference_params
      params.require(:stu_reference).permit(:name, :relationship, :phone, :email)
    end
end
