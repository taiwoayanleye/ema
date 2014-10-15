json.array!(@stu_work_experiences) do |stu_work_experience|
  json.extract! stu_work_experience, :id, :company, :position, :start_date, :end_date, :description
  json.url stu_work_experience_url(stu_work_experience, format: :json)
end
