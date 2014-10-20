class AddStudentProfileIdToSavedJobPostings < ActiveRecord::Migration
  def change
    add_column :saved_job_postings, :student_profile_id, :integer
  end
end
