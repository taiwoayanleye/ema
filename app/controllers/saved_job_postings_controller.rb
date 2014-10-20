class SavedJobPostingsController < ApplicationController
  before_action :set_saved_job_posting, only: [:show, :edit, :update, :destroy]

  def index
    @saved_job_postings = SavedJobPosting.all
    respond_with(@saved_job_postings)
  end

  def show
    respond_with(@saved_job_posting)
  end

  def new
    @saved_job_posting = SavedJobPosting.new
    respond_with(@saved_job_posting)
  end

  def edit
  end

  def create
    @saved_job_posting = SavedJobPosting.new(saved_job_posting_params)
    @saved_job_posting.save
    respond_with(@saved_job_posting)
  end

  def update
    @saved_job_posting.update(saved_job_posting_params)
    respond_with(@saved_job_posting)
  end

  def destroy
    @saved_job_posting.destroy
    respond_with(@saved_job_posting)
  end

  private
    def set_saved_job_posting
      @saved_job_posting = SavedJobPosting.find(params[:id])
    end

    def saved_job_posting_params
      params.require(:saved_job_posting).permit(:position_text, :description_text, :paid_text, :requirements_text)
    end
end
