class User < ActiveRecord::Base
	#ASSOCIATIONS
	belongs_to :profileable, :polymorphic => true
	#DEVISE GOODIES
	  # Include default devise modules. Others available are:
	  # :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :trackable, :validatable

	#The different user types defined in an array the %w[admin student profile] is ruby shorthand for ["admin", "student", "company"]
  	USER_TYPES = %w[student company]
end
