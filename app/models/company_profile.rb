class CompanyProfile < ActiveRecord::Base
	#ASSOCIATIONS
  # has_one :user, as: :profileable, dependent: :destroy
	# has_one :user, dependent: :destroy
	# accepts_nested_attributes_for :user

	has_many :job_postings
  has_many :saved_student_profiles
  has_many :job_applications
  
  # has_many :talent_entires, class_name: "JobApplication", foreign_key: "talent_hunter_id"
  
	# Used for image uploading
	mount_uploader :image, ImageUploader

  # Set pagination limit
  paginates_per 12

  #VALIDATIONS HERE
  validates :company_name, :company_type,
            :format => { :with => /\A[a-zA-Z\'\-\,\!\.\&\(\)\@\#\$\%\" ]*\z/,
                         :message => "Numbers are not allowed." },
            :length => { :minimum => 1,
                         :message => "This field cannot be empty" },
                         :on => :update
  validates :location,
            :format => { :with => /\A[a-zA-Z\,\.\- ]*\z/,
                         :message => "Numbers and symbols are not allowed." },
            :length => { :minimum => 1,
                         :message => "This field cannot be empty" },
                         :on => :update
  validates :description,
            :length => { :maximum => 300,
                         :message => "Over 300 characters" }
  validates :number_of_employees,
            :numericality => { :only_integer => true },
            :on => :update


  validates :website,
            :format => { :with => /\A^(http:\/\/){1}[a-zA-Z0-9\-\.]+\.(com|org|net|edu|COM|ORG|NET|EDU)${1}\z/,
                         :message => "is invalid. Must begin with http:// and end in .com, .org, .net, or .edu." },
                         :on => :update
  validates :reg_code,
            :format => { :with => /\A[a-zA-Z0-9]*\z/,
                         :message => "Symbols are not allowed." },
            :length => { :minimum => 1,
                         :message => "This field cannot be empty" },
                         :on => :update
  def user
      User.where(id: self.user_id).first
  end
end