class AddStudentProfileIdToStuWorkExperience < ActiveRecord::Migration
  def change
    add_column :stu_work_experiences, :student_profile_id, :integer
  end
end
