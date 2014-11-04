class JobApplication < ActiveRecord::Base
	belongs_to :job_postings
	belongs_to :student_profile
	belongs_to :company_profile
	# belongs_to :job_hunter, class_name: "StudentProfile"
	# belongs_to :talent_hunter, class_name: "CompanyProfile"
end
