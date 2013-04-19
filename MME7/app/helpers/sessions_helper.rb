module SessionsHelper
 #Author: Donia Amer Shaarawy 22-0270
 #theses are methods for rember cookies for the website retuners the user
 def log_in(user)
   cookies.permanent[:remember_token] = user.remember_token
   self.current_user(user)
 end
  #Author: Donia Amer Shaarawy 22-0270
  #checks if the user is logged in to save the cookies it return a boolean
 def loged_in?
   !current_user.nil?
 end
 #Author: Donia Amer Shaarawy 22-0270
  #it takes in the user and return the user.id
 def current_user(user)
   @current_user = user
 end
 #Author: Donia Amer Shaarawy 22-0270
  #saves the user.id as @current_user it will return current user 
 def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
 end
 #Author: Donia Amer Shaarawy 22-0270
  #it makes the cookie to know that it doesnt need to save the current user id it dosent return anything
 def log_out
   self.current_user = nil
   cookies.delete(:remember_token)
  end
end