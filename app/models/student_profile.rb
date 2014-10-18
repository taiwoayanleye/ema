class StudentProfile < ActiveRecord::Base
	#ASSOCIATIONS
	has_one :user, as: :profileable, dependent: :destroy
	accepts_nested_attributes_for :user

	# Used for image uploading
	mount_uploader :image, ImageUploader
end
