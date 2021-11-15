class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  # 20211113 modify
  helper_method :current_user
  helper_method :authorized_user

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

  def authorized_user

    # @authorized_user = Admin.find_by(full_name: session[:full_name])
    @authorized_user = session["devise.user_attributes"]
    puts 'authorized user'
    puts @authorized_user
    puts session[:full_name].nil?
    puts 'session[:user_id]'
    puts session[:user_id]
    @authorized_user_id = session[:auth_uid] 
    puts @authorized_user
    puts session.to_hash
    # else
    #   @current_user = User.generate
    #   session[:user_id] = @current_user.id
    #   @current_user
    # end

    # if @current_user.nil?
    #   @current_user = User.generate
    #   session[:user_id] = @current_user.id
    #   @current_user

    return @authorized_user
  # end

  end


end
