json.array!(@company_profiles) do |company_profile|
  json.extract! company_profile, :id, :company_name, :email, :description, :company_type, :number_of_employees, :website, :location, :reg_code, :verified, :image
  json.url company_profile_url(company_profile, format: :json)
end
