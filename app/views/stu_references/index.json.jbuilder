json.array!(@stu_references) do |stu_reference|
  json.extract! stu_reference, :id, :name, :relationship, :phone, :email
  json.url stu_reference_url(stu_reference, format: :json)
end
