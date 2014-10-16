class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :job_id
      t.string :position
      t.text :job_description
      t.date :job_start
      t.date :job_end
      t.date :posted_on
      t.string :position_time
      t.string :job_paid
      t.text :job_requirements

      t.timestamps
    end
  end
end
