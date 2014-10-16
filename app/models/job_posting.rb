class JobPosting < ActiveRecord::Base
#SET ACCESSIBLE ATTRIBUTES HERE
# attr_accessible :company_profile_id, :job_description, :job_end, :job_id, :job_paid, :job_requirements, :job_start, :position, :position_time, :posted_on, :user_id

#ASSOCIATIONS HERE
belongs_to :company_profile

#VALIDATIONS HERE
=begin
=end

validate :validate_end_date_before_start_date
def validate_end_date_before_start_date
	errors.add(:job_end, "must be greater than Start Date.") if job_end < job_start
end

validates :position_time, :job_paid, :position,
        :length => { :minimum => 1,
                     :message => "This field cannot be empty" }
validates :job_description, :job_requirements,
        :length => { :maximum => 300,
                     :message => "Over 300 characters" }

end
