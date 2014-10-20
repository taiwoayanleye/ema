Rails.application.routes.draw do

  resources :saved_student_profiles

  resources :saved_job_postings

  #Website root page
  root 'home#home'
  
  #RailsAdmin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # devise_for :users
  # # devise_for :users

  #Devise routes
  devise_for :users, :controllers => {:registrations => "registrations"}
  #devise_for :users, :controllers => {:users => "users"}
  
  #Resources
  resources :skills
  resources :stu_references
  #resources :users
  resources :job_postings do
    collection do
      get 'search'
    end
  end
  resources :company_profiles
  resources :student_profiles do
    collection do
      get 'search'
    end
  end  
  resources :stu_work_experiences

  get 'home/home'
  get 'pages/about'
  get 'pages/contact'
  get 'registrations/destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
