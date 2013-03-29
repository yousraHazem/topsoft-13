module GroupsHelper


 #Author: Donia Amer Shaarawy 22-0270 
#this method is done to return the member of a specific 
#group thats why we take in parameters group id and it returns the users in the group.
 def getGroupMembers(group_id)

 	groupmembersid = GroupUser.find(:group_id , group_id)
 	puts "{:user_id}"
    names = User.find("user_id = ?", groupmembersid)
 
 end

end
