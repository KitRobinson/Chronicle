class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  #this and the set_current_user method provide a way to scope the current user method into other models
  before_filter :set_current_user

	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authorize
  	redirect_to '/login' unless current_user
	end

  def authorizeAdmin
    redirect_to '/login' unless current_user && current_user.access >=3
  end

  #pass current user method to be usable in other controllers
  def set_current_user
    User.current_user = current_user
    Conversation.current_user = current_user
    Myth.current_user = current_user
  end

  def authorizeProper(allowed_users)
    redirect_to '/login' unless allowed_users.include?(current_user) || current_user.access > 2
  end

end
