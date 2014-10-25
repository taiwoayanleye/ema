class FixStudentProfile < ActiveRecord::Migration
  def change
  	rename_column :student_profiles, :resume, :brief_summary
  end
end
