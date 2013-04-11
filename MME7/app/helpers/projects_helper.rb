module ProjectsHelper

	#Author: Donia Amer Shaarawy 22-0270 
  # getMembersNotInProject takes in a paramater project id and then goes to the user table and find all the users that 
  # are not in this project we will subtrack the users in this project from all users this is done by calling on 
  # get_projectmembers(project_id) method. this is taken from nayera 
  
  # def getMembersNotInProject (project_id)
  #    b = Project.get_projectmembers(project_id)
  #    user = User.all
  #    return result = user - b
     

  # end 

  # authorized by sarah ahmed id:22-1278
  #returns all the projects in the table
  # def get_all_projects
  #    return Project.order("projects.id ASC")
  # end	

#User = User.find(:all)
    #return notusers = User.except(:b)
  

end   				 

