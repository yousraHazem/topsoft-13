class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
def current_user
  return @current_user = User.find(session[:user_id])  if session[:user_id]
  end

  include SessionsHelper
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    log_out
    super
  end
end