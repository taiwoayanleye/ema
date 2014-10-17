class CompanyProfile < ActiveRecord::Base
	#ASSOCIATIONS
	has_one :user, as: :profileable, dependent: :destroy
	accepts_nested_attributes_for :user

	has_many :job_postings
end
