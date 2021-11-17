class Admins::SessionsController < Devise::SessionsController
    def after_sign_out_path_for(_resource_or_scope)
      #puts 'before new admin session path'
      new_admin_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      #puts 'before stored_location_for'
      stored_location_for(resource_or_scope) || root_path
    end
  end