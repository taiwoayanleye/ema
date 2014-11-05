class AddCoverLetterToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :cover_letter, :string
  end
end
