class AddStudentProfileIdToStuInterests < ActiveRecord::Migration
  def change
    add_column :stu_interests, :student_profile_id, :integer
  end
end
