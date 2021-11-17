class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  # 20211113 modify
  helper_method :current_user
  helper_method :authorized_user
  # helper_method :current_admin
  def current_user
    return @current_user if @current_user.present?

    if session[:user_id].present?
      puts "user_id present in session!!"
      @current_user = User.find_by(id: session[:user_id])
    else
      puts "Generating User!!!!"
      puts "Check if we have admin"
      puts session[:full_name]
      @current_user = User.generate
      session[:user_id] = @current_user.id
      @current_user
    end

    if @current_user.nil?
      @current_user = User.generate
      session[:user_id] = @current_user.id
      @current_user
    end

    @current_user
  end
end
