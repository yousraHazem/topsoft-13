class ApplicationController < ActionController::Base
  protect_from_forgery
  #Author: Donia Amer Shaarawy 22-0270
  #it takes userid in a session and save it in a variable current_user returns current user id 
  def current_user
   return @current_user = User.find(session[:user_id])  if session[:user_id]
  end
  helper_method :current_user
  include SessionsHelper
  #Author: Donia Amer Shaarawy 22-0270
  # Force signout to prevent CSRF (one-click attack or session riding) attacks
  def handle_unverified_request
    log_out
    super
  end
end