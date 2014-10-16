json.array!(@job_postings) do |job_posting|
  json.extract! job_posting, :id, :job_id, :position, :job_description, :job_start, :job_end, :posted_on, :position_time, :job, :job_requirements
  json.url job_posting_url(job_posting, format: :json)
end
