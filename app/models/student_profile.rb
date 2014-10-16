class StudentProfile < ActiveRecord::Base
	#ASSOCIATIONS
	has_one :user, :as => :profileable
end
