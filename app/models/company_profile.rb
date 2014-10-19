class CompanyProfile < ActiveRecord::Base
	#ASSOCIATIONS
	has_one :user, as: :profileable, dependent: :destroy
	accepts_nested_attributes_for :user
	has_many :job_postings

	# Used for image uploading
	mount_uploader :image, ImageUploader
end

#VALIDATIONS HERE
=begin
=end

validates :company_name, :company_type,
            :format => { :with => /\A[a-zA-Z\'\-\,\!\.\&\(\)\@\#\$\%\" ]*\z/,
                         :message => "Numbers are not allowed." },
            :length => { :minimum => 1,
                         :message => "This field cannot be empty" }
  validates :location,
            :format => { :with => /\A[a-zA-Z\,\.\- ]*\z/,
                         :message => "Numbers and symbols are not allowed." },
            :length => { :minimum => 1,
                         :message => "This field cannot be empty" }
  validates :description,
            :length => { :maximum => 300,
                         :message => "Over 300 characters" }
  validates :number_of_employees,
            :numericality => { :only_integer => true }


  validates :website,
            :format => { :with => /\A^(http:\/\/){1}[a-zA-Z0-9\-\.]+\.(com|org|net|edu|COM|ORG|NET|EDU)${1}\z/,
                         :message => "is invalid. Must begin with http:// and end in .com, .org, .net, or .edu." }
  validates :reg_code,
            :format => { :with => /\A[a-zA-Z0-9]*\z/,
                         :message => "Symbols are not allowed." },
            :length => { :minimum => 1,
                         :message => "This field cannot be empty" }