class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  #Author: Donia Amer Shaarawy 22-0270
  #we save the current user id in a session so we could have it through out all his navegation
  private
  def current_user
   return @current_user = User.find(session[:user_id])  if session[:user_id]
  end

  include SessionsHelper
  #Author: Donia Amer Shaarawy 22-0270
   # Force signout to prevent CSRF (one-click attack or session riding) attacks
  def handle_unverified_request
    log_out
    super
  end
end