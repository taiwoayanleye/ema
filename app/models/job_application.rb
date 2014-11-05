class JobApplication < ActiveRecord::Base
	belongs_to :job_posting
	belongs_to :student_profile
	belongs_to :company_profile

	# Used for application coverletter uploading
	mount_uploader :cover_letter, CoverLetterUploader
end
