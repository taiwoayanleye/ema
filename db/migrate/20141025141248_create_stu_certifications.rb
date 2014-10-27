class CreateStuCertifications < ActiveRecord::Migration
  def change
    create_table :stu_certifications do |t|
      t.string :description

      t.timestamps
    end
  end
end
