module UsersHelper
	  def getMembersNotInProject (project_id)
    a = Projects.get_projectmembers(project_id)
    notProjectUser = User.except(a)
  end 

  #getMembersNotInProject takes in a paramater project id and then goes to the user table and find all the users that 
#are not in this project we will subtrack the users in this project from all users this is done by calling on 
#get_projectmembers(project_id) method.

      def getMembersNotInGroups (group_id)
      b = Groups.get_groupmembers(group_id)
    notGroupUser = User.except(b)
  end 

#getMembersNotInGroups takes in a paramater group id and then goes to the user table and find all the users that 
#are not in this group we will subtrack the users in this group from all users this is done by calling on 
#get_groupmembers(group_id) method.

end
