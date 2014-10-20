class AddStudentProfileIdToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :student_profile_id, :integer
  end
end
