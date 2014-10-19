class StudentProfile < ActiveRecord::Base
	#ASSOCIATIONS
	has_one :user, as: :profileable, dependent: :destroy
	accepts_nested_attributes_for :user

	# Used for image uploading
	mount_uploader :image, ImageUploader

	#VALIDATIONS HERE
=begin
=end
    validates :first_name, :last_name, :last_completed_degree, :school,
              :format => { :with => /\A[a-zA-Z\'\- ]*\z/,
                           :message => "Numbers and symbols are not allowed." },
              :length => { :minimum => 1,
                           :message => "This field cannot be empty" }
end