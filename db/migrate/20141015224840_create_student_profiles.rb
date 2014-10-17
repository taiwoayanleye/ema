class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :school
      t.string :expected_graduation
      t.string :school_year
      t.string :last_completed_degree
      t.string :residential_address
      t.string :major
      t.string :resume
      t.string :image

      t.timestamps
    end
  end
end
