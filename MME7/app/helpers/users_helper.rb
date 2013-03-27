module UsersHelper
	  def getMembersNotInProject (project_id)
    a = Projects.get_projectmembers(project_id)
    notProjectUser = User.except(a)
  end 

  #getMembersNotInProject takes in a paramater project id and then goes to the user table and find all the users that 
#are not in this project we will subtrack the users in this project from all users this is done by calling on 
#get_projectmembers(project_id) method.

  
end
