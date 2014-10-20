class SavedStudentProfile < ActiveRecord::Base
	#ASSOCIATION
	belongs_to :company_profile
end
