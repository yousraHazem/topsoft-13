module SessionsHelper
  #Author: Donia Amer Shaarawy 22-0270
#theses are methods for rember cookies for the website 
 def log_in(user)
   cookies.permanent[:remember_token] = user.remember_token
  self.current_user(user)
  end
  def loged_in?
   !current_user.nil?
  end
  def current_user(user)
  @current_user = user
 end
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  def log_out
   self.current_user = nil
    cookies.delete(:remember_token)
  end
end