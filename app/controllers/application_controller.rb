class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  #return the current logged in user or nil if there is not one
  def current_user
    return unless session[:user_id]
    @curent_user ||= User.find_by_id(session[:user_id])
  end

  #make current_user available in tamplates as helper
  helper_method :current_user

  #filter method to enforce a login requirement
  def authenticate
    logged_in? || access_denied
  end

  def logged_in?
    current_user.is_a? User
  end

  helper_method :logged_in?

  def access_denied
    redirect_to login_path, notice: "Please, log in to continue" and return false
  end
end
