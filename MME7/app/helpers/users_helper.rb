module UsersHelper
	#Author: Donia Amer Shaarawy 22-0270 
	 #getMembersNotInProject takes in a paramater project id and then goes to the user table and find all the users that 
#are not in this project we will subtrack the users in this project from all users this is done by calling on 
#get_projectmembers(project_id) method. this is taken from nayera 

	  def getMembersNotInProject (project_id)
    a = Project.get_projectmembers(project_id)
    notProjectUser = User.except(a)
  end 

 
 #Author: Donia Amer Shaarawy 22-0270 
#getMembersNotInGroups takes in a paramater group id and then goes to the user table and find all the users that 
#are not in this group we will subtrack the users in this group from all users this is done by calling on 
#get_groupmembers(group_id) method.
      def getMembersNotInGroup (group_id)
      b = Group.getGroupMembers(group_id)
    notGroupUser = User.except(b)
  end 



end
