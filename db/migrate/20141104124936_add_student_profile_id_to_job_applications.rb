class AddStudentProfileIdToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :student_profile_id, :integer
  end
end
