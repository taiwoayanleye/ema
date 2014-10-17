class AddUserIdToStudentProfiles < ActiveRecord::Migration
  def change
    add_column :student_profiles, :user_id, :string
  end
end
