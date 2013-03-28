module GroupUsersHelper

#this is a method that shows if the current user the person 
#who is loged in is the creator of the group or not.
		def isGroupCreator( user_id, group_id)
	groupCreator = GroupUsers.where(:group_id => group_id, :user_id => user_id, :is_creator => true).exists?
	if groupCreator == true
		return true
	else 
		return false 
	end 
	end 

	#add a user to a group add it in the join table 
 def addMembers (group_id, user_id, isCreator)
 	m = GroupUser.new(:group_id => group_id, :user_id => user_id, :is_creator => isCreator)
 	m.save

end
end
