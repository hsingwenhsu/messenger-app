class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    #It’s called after the user selects their Google account.
    helper_method :google_oauth2
    helper_method :google_user
    helper_method :current_admin
    def google_oauth2
      admin = Admin.from_google(from_google_params)
      @google_user = @from_google_params
      puts 'callback controller'
      session["devise.user_attributes"] = admin.attributes
      puts 'session["devise.user_attributes"]'
      puts session["devise.user_attributes"]
      #session[:full_name] = @google_user[:full_name]
      session[:full_name] = @auth.info.name
      puts session[:full_name]
      session[:auth_uid] = @google_user[:uid]
      puts session[:full_name]
      puts session.to_hash
      if admin.present?
        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect admin, event: :authentication
      else
        flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
        redirect_to new_admin_session_path
      end
    end
    
    def current_admin
      @current_admin || Admin.find(session[:auth_uid])
    end
    # protected
  
    def after_omniauth_failure_path_for(_scope)
      new_admin_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end
  
    # private
  
    def from_google_params
      @from_google_params ||= {
        uid: auth.uid,
        email: auth.info.email,
        full_name: auth.info.name,
        avatar_url: auth.info.image
      }
    end
  
    def auth
      @auth ||= request.env['omniauth.auth']
    end
  end
  view raw