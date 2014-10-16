class AddUserIdToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :user_id, :string
  end
end
