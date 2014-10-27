class AddStudentProfileIdToStuCertifications < ActiveRecord::Migration
  def change
    add_column :stu_certifications, :student_profile_id, :integer
  end
end
