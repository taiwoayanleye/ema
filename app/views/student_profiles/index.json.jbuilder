json.array!(@student_profiles) do |student_profile|
  json.extract! student_profile, :id, :first_name, :last_name, :school, :email, :expected_graduation, :school_year, :last_completed_degree, :residential_address, :major, :resume, :image
  json.url student_profile_url(student_profile, format: :json)
end
