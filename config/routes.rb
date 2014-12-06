Rails.application.routes.draw do

  get 'blog/index'

  resources :job_applications

  resources :saved_student_profiles

  resources :saved_job_postings

  #Website root page
  # root 'blog#index'
  root 'job_postings#search'
  
  #RailsAdmin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # devise_for :users
  # # devise_for :users

  #Devise routes
  devise_for :users, :controllers => {:registrations => "registrations"}, 
                      :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  #devise_for :users, :controllers => {:users => "users"}
  
  #Student resources
  resources :skills
  resources :stu_references
  resources :stu_certifications
  resources :stu_interests
  resources :stu_work_experiences
  #resources :users
  resources :job_postings do
    collection do
      get 'search'
    end
    # Job application link from job postings page
    resources :job_applications, only: [:new, :create]
    # Creating URLs and caching for pagination
    get 'page/:page', :action => :search, :on => :collection
  end
  resources :company_profiles
  resources :student_profiles do
    collection do
      get 'search'
    end
  # Creating friendly URLs and caching for pagination
  get 'page/:page', :action => :search, :on => :collection
  end  


  get 'home/home'
  get 'pages/about'
  get 'pages/contact'
  get 'registrations/destroy'

  get 'company_posting' => "job_postings#company_posting"
  get 'offers' => "job_applications#offers"
  get 'applicants' => "job_applications#applicants"

  #Blog
  mount Monologue::Engine, at: '/idea'
end
