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


end
