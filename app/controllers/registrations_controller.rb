class RegistrationsController < Devise::RegistrationsController
  def destroy
  	cur_user = current_user.id

    if StudentProfile.exists?(cur_user)
      StudentProfile.find(cur_user).destroy
    elsif CompanyProfile.exists?(cur_user)
      CompanyProfile.find(cur_user).destroy
    end

    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_navigational_format?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

    protected

  # Redirects the user to the appropriate page after registering
  def after_sign_up_path_for(user)
    user_type = current_user.user_type

    if user_type == "student"
      new_student_profile_url

    elsif user_type == "company"
      new_company_profile_path

    elsif user_type == "admin"
      admin_root_url
    else
    end
  end

  def after_update_path_for(user)
    after_sign_in_path_for(user)
  end
  
end
