#encoding: UTF-8
module GroupUsersHelper

   # Author: Mariam Ismail 22-3456
   # This method checks if a user is an already exisiting member in a specific group or not
   # This method takes the group id and user id, and returns true/false
   def ifMember(group_id,user_id)
      GroupUser.where(:group_id => group_id, :user_id => user_id).exists?
   end
end

