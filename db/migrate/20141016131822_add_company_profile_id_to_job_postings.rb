class AddCompanyProfileIdToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :company_profile_id, :integer
  end
end
