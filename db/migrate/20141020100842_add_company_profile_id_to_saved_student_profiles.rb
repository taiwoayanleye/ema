class AddCompanyProfileIdToSavedStudentProfiles < ActiveRecord::Migration
  def change
    add_column :saved_student_profiles, :company_profile_id, :integer
  end
end
