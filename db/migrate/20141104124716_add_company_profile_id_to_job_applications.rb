class AddCompanyProfileIdToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :company_profile_id, :integer
  end
end
