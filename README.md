CREATING MVC

1
Student work experience
column:5
{company:string, position:string, start_date:date, end_date:date, description:text}
[rails generate scaffold StuWorkExperience company:string position:string start_date:date end_date:date description:text]

2
Skill
column:1
{description:string}
[rails generate scaffold skill description:string]


3
Student profile
column:10
{ first_name:string, last_name:string, school:string, email:string, expected_graduation:string, school_year:string, last_completed_degree:string, residential_address:string, major:string, resume:string, image:string}
[rails generate scaffold StudentProfile first_name last_name school email expected_graduation school_year last_completed_degree residential_address major resume image]

Others:
Add user_id_to_student_profiles
[ rails generate migration AddUserIdToStudentProfiles user_id]


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

12
Saved student profiles
column:4
{school_text:string, year_text:string, skill_text:string, culture:string}
[rails generate scaffold SavedStudentProfile school_text year_text skill_text culture]

