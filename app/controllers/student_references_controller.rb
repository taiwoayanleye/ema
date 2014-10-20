class StudentReferencesController < ApplicationController
  before_action :set_student_reference, only: [:show, :edit, :update, :destroy]

  def index
    @student_references = StudentReference.all
    respond_with(@student_references)
  end

  def show
    respond_with(@student_reference)
  end

  def new
    @student_reference = StudentReference.new
    respond_with(@student_reference)
  end

  def edit
  end

  def create
    @student_reference = StudentReference.new(student_reference_params)
    @student_reference.save
    respond_with(@student_reference)
  end

  def update
    @student_reference.update(student_reference_params)
    respond_with(@student_reference)
  end

  def destroy
    @student_reference.destroy
    respond_with(@student_reference)
  end

  private
    def set_student_reference
      @student_reference = StudentReference.find(params[:id])
    end

    def student_reference_params
      params.require(:student_reference).permit(:name, :relationship, :phone, :email)
    end
end
