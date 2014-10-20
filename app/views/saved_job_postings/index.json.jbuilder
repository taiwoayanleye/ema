json.array!(@saved_job_postings) do |saved_job_posting|
  json.extract! saved_job_posting, :id, :position_text, :description_text, :paid_text, :requirements_text
  json.url saved_job_posting_url(saved_job_posting, format: :json)
end
