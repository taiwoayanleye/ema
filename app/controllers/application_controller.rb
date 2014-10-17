class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # # Redirect to the login page if the user was not logged in.
  # before_action :authenticate_user!

  #strong parameters to customize our views for Devise in Rails 4
  before_action :configure_permitted_parameters, if: :devise_controller?

   # def authenticate_active_admin_user!
   #  authenticate_user!
   #  unless current_user.user_type == "admin"
   #    flash[:alert] = "Unauthorized Access!"
   #    if current_user.user_type == "student"
   #      redirect_to student_profile_url(current_user.id)
   #    else
   #      redirect_to company_profile_url(current_user.id)
   #    end
   #  end
   # end

    #Returns the type of profile for the current user
    def get_profile_type
      return current_user.user_type
    end

    #checks if profile with the given id exists, if not, it redirects them to new
    def profile_redir
      if get_profile_type == "student"
        if !StudentProfile.exists?(current_user.id)
          redirect_to new_student_profile_url, notice: 'You are not authorized to access that page yet!'
        end
      elsif get_profile_type == "company"
        if !CompanyProfile.exists?(current_user.id)
          redirect_to new_company_profile_url, notice: 'You are not authorized to access that page yet!'
        end
      end
    end

    #gets the current user's profile
    def get_user
      if get_profile_type == "student"
        @user = StudentProfile.find_by_user_id(current_user.id.to_s)
      elsif get_profile_type == "company"
        @user = CompanyProfile.find_by_user_id(current_user.id.to_s)
      else #for admin
        @user = current_user
      end
    end

    #Redirects the user after successful sign in
    def after_sign_in_path_for(user)
      user_type = current_user.user_type
      user_id = current_user.id.to_s

      if user_type == "student"
        student_profile_url(user_id)

      elsif user_type == "company"
        company_profile_url(user_id)

      elsif user_type == "admin"
        admin_root_url
      else
        #do nothing here. There isn't another kind of user but I wanted to be specific for the admin case in
        #case there is some hole I'm not thinking of like a user being able to get access without having a
        #type
      end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :user_type
    end
end
