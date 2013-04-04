class ProjectUsersController < ApplicationController
include ProjectUsersHelper
  #Authored by Toka Omar  id:22-1925
  #this method takes input :user_id and outputs: list of projects that have the same user_id 
  #for a user to be able to see their projects 
  def get_myprojects(userid)
   @projectusers = ProjectUser.find(:all, 
   	:conditions => {:user_id => userid}, 
   	:order => "project_id ASC",)
    end 
end