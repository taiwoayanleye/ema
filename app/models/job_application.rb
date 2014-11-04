class JobApplication < ActiveRecord::Base
	belongs_to :job_postings
	belongs_to :student_profile
	belongs_to :company_profile

end
