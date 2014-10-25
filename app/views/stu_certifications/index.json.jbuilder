json.array!(@stu_certifications) do |stu_certification|
  json.extract! stu_certification, :id, :description
  json.url stu_certification_url(stu_certification, format: :json)
end
