class UsersController < ApplicationController
	#Authored by Toka Omar  id:22-1925
  	#this method has no inputs and outputs: the projects of the current user  
  	#the method returs a list of projects the user has  
def get_myprojects
  @projectusers = ProjectUser.find(:all, 
   :conditions => {:user_id => current_user.id}, 
   :order => "project_id ASC",)
   @user_name = User.find(current_user.id)
    end 
end 
