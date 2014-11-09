class Skill < ActiveRecord::Base
	#ASSOCIATIONS
	belongs_to :student_profile

	#VALIDATIONS HERE
	# validates :description,
	#         :length => { :minimum => 1,
	#                      :message => "This field cannot be empty" }
	# validates :description,
	#         :length => { :maximum => 32,
	#                      :message => "Too long." }
	# validates_uniqueness_of :description, :scope => :student_profile_id, :case_sensitive => false
end
