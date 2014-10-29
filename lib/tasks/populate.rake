namespace :db do
	desc "Create students and employers profile"
	task :populate => :environment do
		require 'populator'
		require 'faker'
			StudentProfile.populate 100 do |s|
				s.first_name = Faker::Name.first_name
				s.last_name = Faker::Name.last_name
				s.school = Faker::Company.name
				s.expected_graduation = Faker::Business.credit_card_expiry_date
				s.school_year = 	Faker::Lorem.word
				s.last_completed_degree = Faker::Commerce.department
				s.residential_address = Faker::Address.street_address
				s.major = Faker::Commerce.department
				s.brief_summary = Faker::Lorem.paragraph
				s.image = Faker::Avatar.image("my-own-slug", "50x50")
			end
			puts 'Student done'

			CompanyProfile.populate 100 do |c|
				c.company_name = Faker::Company.name
				c.description = Faker::Company.catch_phrase
				c.company_type = Faker::Company.suffix
				c.number_of_employees = Faker::Number.number(3)
				c.website = Faker::Internet.url
				c.location = Faker::Address.city
				c.reg_code = Faker::Company.duns_number
				c.image = Faker::Company.logo
			end
			puts 'Company done'
	end
end