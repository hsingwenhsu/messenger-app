class LoginsController < ApplicationController
    def new
    end
  
    def create
        #puts GoogleSignIn::Identity.new(id_token).user_id
    #   if user = authenticate_with_google
    #     cookies.signed[:user_id] = user.id
    #     redirect_to user
    #   else
    redirect_to "http://localhost:3000/rooms", alert: 'authentication_failed'
      #end
    end
  
    private
      def authenticate_with_google
        if id_token = flash[:google_sign_in][:id_token]
          User.find_by google_id: GoogleSignIn::Identity.new(id_token).user_id
        elsif error = flash[:google_sign_in][:error]
          logger.error "Google authentication error: #{error}"
          nil
        end
      end
  end