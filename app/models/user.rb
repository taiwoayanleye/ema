class User < ActiveRecord::Base

	#ASSOCIATIONS
	# belongs_to :profileable

	after_create :create_profileable_user
	
	#DEVISE GOODIES
	  # Include default devise modules. Others available are:
	  # :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable,
           :confirmable

	#The different user types defined in an array the %w[admin student profile] is ruby shorthand for ["admin", "student", "company"]
  	USER_TYPES = %w[student company]

  #Parses user to create_company_user method if user_type is company or(:) student if it's student
  	def create_profileable_user
  		user_type === "company" ? create_company_user : create_student_user
  	end

    #Updates profilable field for company
  	def create_company_user
  		company = CompanyProfile.create!(user_id: self.id)
  		update_profileable_data(company)
  	end

    #Updates profilable field for student
  	def create_student_user
  		student = StudentProfile.create!(user_id: self.id)
  		update_profileable_data(student)
  	end

    #
  	def update_profileable_data(user)
  		self.profileable_id = user.id
  		self.profileable_type = user.class.name.capitalize.to_s
  		self.save!
  	end

    #Verifying company
  	def company_verified?
  		return true if CompanyProfile.where(id: self.profileable_id).first.verified === true
  	end

    #
    def profile
      if self.user_type === "company"
        CompanyProfile.where(id: profileable_id).first if self.user_type === "company"
      else
        StudentProfile.where(id: profileable_id).first if self.user_type === "student"
      end
    end
end
