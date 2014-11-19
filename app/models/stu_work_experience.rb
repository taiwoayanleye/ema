class StuWorkExperience < ActiveRecord::Base
	#ASSOCIATIONS
	belongs_to :student_profile

	#VALIDATIONS HERE
	# validates :company, :position,
	#         :format => { :with => /\A[a-zA-Z\'\-\+\&\! ]*\z/,
	#                      :message => "Numbers and symbols are not allowed." },
	#         :length => { :minimum => 1,
	#                      :message => "This field cannot be empty" }
	# validates :end_date,
	#         :length => { :minimum => 1,
	#                      :message => "This field cannot be empty" }
	# validates :description,
	#         :length => { :maximum => 300,
	#                      :message => "Over 300 characters" }
end
