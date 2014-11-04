class StudentProfile < ActiveRecord::Base
	#ASSOCIATIONS
	# has_one :user, as: :profileable, dependent: :destroy
	# accepts_nested_attributes_for :user
	has_many :stu_work_experiences
	has_many :skills
	has_many :stu_references
	has_many :saved_job_postings
	has_many :stu_interests
	has_many :stu_certifications
	has_many :job_entries, class_name: "JobApplication", foreign_key: "job_hunter_id"

	# Used for image uploading
	mount_uploader :image, ImageUploader

	# Set pagination limit
	paginates_per 9

	# VALIDATIONS HERE
    validates :first_name, :last_name, :last_completed_degree, :school,
              :format => { :with => /\A[a-zA-Z\'\- ]*\z/,
                           :message => "Numbers and symbols are not allowed." },
              :length => { :minimum => 1,
                           :message => "This field cannot be empty" },
               :on => :update
    def user
    	User.where(id: self.user_id).first
    end
end