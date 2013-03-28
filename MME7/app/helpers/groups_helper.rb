module GroupsHelper


  
#this method is done to return the member of a specific 
#group thats why we take in parameters group id and it returns the users in the group.
 def get_groupmembers(group_id)

 	groupmembersid = Groupusers.find(:all).where(:group_id => group_id)
 	puts "{:user_id}"
    names = Users.where(:user_id => groupmembersid)
 
 end




end
