#encoding: UTF-8
module GroupUsersHelper

   # Author: Mariam Ismail 22-3456
   # This method checks if a user is an already exisiting member in a specific group or not
   # This method takes the group id and user id, and returns true/false
   def ifMember(group_id,user_id)
      GroupUser.where(:group_id => group_id, :user_id => user_id).exists?
   end

   #Author: Donia Amer Shaarawy 22-0270 
   #this is a method that shows if the current user the person 
   #who is loged in is the creator of the group or not.
   def isGroupCreator(group_id,user_id)
   GroupUser.where(:group_id => group_id, :user_id => user_id, :isCreator => true).exists?
   end
end

