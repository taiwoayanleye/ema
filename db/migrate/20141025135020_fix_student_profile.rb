class FixStudentProfile < ActiveRecord::Migration
  def change
  	rename_column :student_profiles, :resume, :brife_summary  	
  end
end
