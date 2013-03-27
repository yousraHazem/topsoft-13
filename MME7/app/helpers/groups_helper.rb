module GroupsHelper
		def isGroupCreator( user_id)
	groupCreator = Group_Users.where(:group_id => this.id, :user_id => user_id, :is_creator => true).exists?
	if groupCreator == true
		return true
	else 
		return false 
	end 
	end 


#this is a method that shows if the current user the person 
#who is loged in is the creator of the group or not.  
 def get_groupmembers(group_id)

 	groupmembersid = Groupusers.find(:all).where(:group_id => group_id)
 	puts "{:user_id}"
    Names = User.where(:user_id => groupmembersid)
 
 end
#this method is done to return the member of a specific 
#group thats why we take in parameters group id and it returns the users in the group.

end
