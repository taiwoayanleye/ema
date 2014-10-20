class AddStudentProfileIdToStuReferences < ActiveRecord::Migration
  def change
    add_column :stu_references, :student_profile_id, :integer
  end
end
