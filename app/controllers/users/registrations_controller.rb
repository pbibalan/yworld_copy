class Users::RegistrationsController < Devise::RegistrationsController
  layout 'user_edit', :only => [:edit]
  # force_ssl :only => [:new, :create, :edit, :update]
  # 
  # protected
  # 
  # def after_inactive_sign_up_path_for(resource)
  #   root_url(:protocol => 'http')
  # end
  # 
  def after_sign_up_path_for(resource)
    flash[:notice] =  "Thanks for signing up with #{APP_CONFIG[:company_name]}!"
    root_url
  end
  # 
  # def after_update_path_for(resource)
  #   '/designers/dashboard'
  # end
  
  # def after_update_path_for(resource)
  #   edit_user_registration_url(:protocol => 'http')
  # end

  # def new
  #   redirect_to apply_path
  # end
  
  #override build_resource to include invitee

end