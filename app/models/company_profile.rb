class CompanyProfile < ActiveRecord::Base
	#ASSOCIATIONS
	has_one :user, :as => :profileable
	has_many :job_postings
	accepts_nested_attributes_for :user
end
