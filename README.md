CREATING MVC

1
Student work experience
column:5
{company:string, position:string, start_date:date, end_date:date, description:text}
[rails generate scaffold StuWorkExperience company:string position:string start_date:date end_date:date description:text]

Others:
Add student_profile_id_to_stu_work_experience
[rails generate migration AddStudentProfileIdToStuWorkExperience student_profile_id:integer]

2
Skill
column:1
{description:string}
[rails generate scaffold skill description:string]

Others:
Add user_id_to_skills
[rails generate migration AddUserIdToSkills user_id:integer]

Add student_profile_id_to_skills
[rails generate migration AddStudentProfileIdToSkills student_profile_id:integer]


3
Student profile
column:10
{ first_name:string, last_name:string, school:string, email:string, expected_graduation:string, school_year:string, last_completed_degree:string, residential_address:string, major:string, resume:string, image:string}
[rails generate scaffold StudentProfile first_name last_name school email expected_graduation school_year last_completed_degree residential_address major resume image] 

Others:
Add user_id_to_student_profiles
[ rails generate migration AddUserIdToStudentProfiles user_id]

Change resume_to_summary_in_student_profiles
[ rails generate migration FixStudentProfile ]
def change
  rename_column :student_profiles, :resume, :brife_summary
end


4
Company profile
column:9
{company_name:string, email:string, description:text, company_type:string, number_of_employees:integer, website:string, location:string, reg_code:string, verified:boolean, image:string}
[rails generate scaffold CompanyProfile company_name email description:text company_type number_of_employees:integer website location reg_code verified:boolean image]

Others:
Add user_id_to_company_profiles
[ rails generate migration AddUserIdToCompanyProfiles user_id ]

5
Devise
[rails generate model devise User]

6
Admin notes
column:

7
Admin notes to comments

8
Job postings
column:8
{job_id:string, position:string, job_description:text, job_start:date, job_end:date, posted_on:date, position_time:string, job_paid:string, job_requirements:text}
[rails generate scaffold JobPosting job_id position job_description:text job_start:date job_end:date posted_on:date position_time job:paid job_requirements:text]
Display: Duration, Location, Sector, Date Postion is expiring, Company's Name, Job Title. Details.

Others:
Add user_id and company_profile_id with migration
[ rails generate migration AddUserIdToJobPosting user_id:string ]
[ rails generate migration AddCompanyProfileIdToJobPosting company_profile_id:integer]

Add Home controller and views
[ rails generate controller Home home ]
Add Registration controller
[ rails generate controller Registration destroy ]



9
Student references
column:5
{uid:string, name:string, relationship:string, phone:string, email:string}
[rails generate scaffold StudentReference uid name relationship phone email]

Other:
Add student_profile_id_to_student_references
[rails generate migration AddStudentProfileIdToStudentReferences student_profile_id:integer]

10
Groups
column:1
{description:string}
[rails generate scaffold Group description]

11
Saved job postings
column:5
{position_text:string, description_text:string, paid_text:string, requirements_text:string, culture:string}
[rails generate scaffold SavedJobPosting position_text description_text paid_text requirements_text culture]

Others:
Add student_profile_id_to_saved_job_postings
[ rails generate migration AddStudentProfileIdToSavedJobPostings student_profile_id:integer ]

12
Saved student profiles
column:4
{school_text:string, year_text:string, skill_text:string, culture:string}
[rails generate scaffold SavedStudentProfile school_text year_text skill_text culture]

Others:
Add company_profile_id_to_saved_student_profiles
[rails generate migration AddCompanyProfileIdToSavedStudentProfiles company_profile_id:integer]

13
Interests
column:1
{description:string}
[rails generate scaffold StuInterest description]

Others:
Add user_id_to_stu_interests
[rails generate migration AddUserIdToStuInterests user_id:integer]

Add student_profile_id_to_stu_interests
[rails generate migration AddStudentProfileIdToStuInterests student_profile_id:integer]

14
Certifications
column:1
{description:string}
[rails generate scaffold StuCertification description]

Others:
Add user_id_to_stu_certifications
[rails generate migration AddUserIdToStuCertifications user_id:integer]

Add student_profile_id_to_stu_certifications
[rails generate migration AddStudentProfileIdToStuCertifications student_profile_id:integer]

14
This should be a dashboard for companies.
Job applications
column:
{student_profile_id, company_profile_id}
[rails generate scaffold JobApplications]
