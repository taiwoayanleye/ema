class CreateStuWorkExperiences < ActiveRecord::Migration
  def change
    create_table :stu_work_experiences do |t|
      t.string :company
      t.string :position
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
