class CreateSavedStudentProfiles < ActiveRecord::Migration
  def change
    create_table :saved_student_profiles do |t|
      t.string :school_text
      t.string :year_text
      t.string :skill_text

      t.timestamps
    end
  end
end
