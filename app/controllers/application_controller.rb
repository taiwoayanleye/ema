class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # # Redirect to the login page if the user was not logged in.
  # before_action :authenticate_user!
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

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :user_type
    end
end
