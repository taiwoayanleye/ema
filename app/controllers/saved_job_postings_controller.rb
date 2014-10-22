class SavedJobPostingsController < ApplicationController
  before_action :set_saved_job_posting, only: [:edit, :update, :destroy]

  before_filter :authenticate_user!
 
  #keep user from accesing any method that isn't connected to thier profile
  before_filter {
    |c|
    if SavedJobPosting.exits?(params[:id])
      c.deny_access(SavedJobPosting.find(params[:id]).student_profile_id)
    else
      if c.get_profile_type != "student"
        c.deny_access(-1)
      end
    end
  }

  # def index
  #   @saved_job_postings = SavedJobPosting.all
  #   respond_with(@saved_job_postings)
  # end

  # def show
  #   respond_with(@saved_job_posting)
  # end

  # def new
  #   @saved_job_posting = SavedJobPosting.new
  #   respond_with(@saved_job_posting)
  # end

  # GET /saved_job_posting/1/edit
  def edit
    @saved_job_posting = SavedJobPosting.find(params[:id])
    @pay = ['', 'Paid', 'Unpaid']
  end

  # def create
  #   @saved_job_posting = SavedJobPosting.new(saved_job_posting_params)
  #   @saved_job_posting.save
  #   respond_with(@saved_job_posting)
  # end

  # PUT /saved_job_posting/1
  # PUT /saved_job_posting/1.json
  def update
    # @saved_job_posting.update(saved_job_posting_params)
    @saved_job_posting = SavedJobPosting.find(params[:id])

    respond_to do |format|
      if @saved_job_posting.update_attributes(params[:saved_job_posting])
        format.html { redirect_to search_job_postings_url, notice: 'Saved search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saved_job_posting.errors, status: :unprocessable_entity }
      end    
    end
  end

  # DELETE /saved_job_posting/1
  # DELETE /saved_job_posting/1.json
  def destroy
    @saved_job_posting = SavedJobPosting.find(params[:id])
    @saved_job_posting.destroy

    respond_to do |format|
      format.html { redirect_to search_job_posting_url, :notice => 'Saved search was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
    def set_saved_job_posting
      @saved_job_posting = SavedJobPosting.find(params[:id])
    end

    def saved_job_posting_params
      params.require(:saved_job_posting).permit(:position_text, :description_text, :paid_text, :requirements_text)
    end
end
