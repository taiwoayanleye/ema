json.array!(@stu_interests) do |stu_interest|
  json.extract! stu_interest, :id, :description
  json.url stu_interest_url(stu_interest, format: :json)
end
