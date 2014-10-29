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
				s.image = Faker::Avatar.image("my-own-slug", "50x50", "jpg")
			end
			puts 'Student done'
	end
end