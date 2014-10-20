json.array!(@student_references) do |student_reference|
  json.extract! student_reference, :id, :name, :relationship, :phone, :email
  json.url student_reference_url(student_reference, format: :json)
end
