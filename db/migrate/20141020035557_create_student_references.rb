class CreateStudentReferences < ActiveRecord::Migration
  def change
    create_table :student_references do |t|
      t.string :name
      t.string :relationship
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
