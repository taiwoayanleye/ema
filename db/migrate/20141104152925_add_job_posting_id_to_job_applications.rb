class AddJobPostingIdToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :job_posting_id, :integer
  end
end
