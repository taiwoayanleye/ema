class RegistrationsController < Devise::RegistrationsController
  def destroy
    current_user.profile.destroy!
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_navigational_format?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

protected

  # Redirects the user to the appropriate page after registering
  def after_sign_up_path_for(user)
    user_type = current_user.user_type

    if user_type === "student"
      edit_student_profile_path(id: current_user.profileable_id)

    elsif user_type === "company"
      edit_company_profile_path(id: current_user.profileable_id)
    end
  end

  def after_update_path_for(user)
    after_sign_in_path_for(user)
  end
  
end
