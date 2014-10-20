json.array!(@saved_student_profiles) do |saved_student_profile|
  json.extract! saved_student_profile, :id, :school_text, :year_text, :skill_text
  json.url saved_student_profile_url(saved_student_profile, format: :json)
end
