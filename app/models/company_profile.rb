class CompanyProfile < ActiveRecord::Base
	#ASSOCIATIONS
	has_one :user, :as => :profileable
	has_many :job_postings
end
