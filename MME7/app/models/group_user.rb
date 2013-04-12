
﻿# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  isCreator  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GroupUser < ActiveRecord::Base
   attr_accessible :group_id , :user_id , :isCreator
  belongs_to :group 
  belongs_to :user

   #Author: Donia Amer Shaarawy 22-0270 
   #this is a method that shows if the current user the person 
   #who is loged in is the creator of the group or not.
   def isGroupCreator(group_id,user_id)
	  GroupUser.where(:group_id => group_id, :user_id => user_id, :isCreator => true).exists?
   end 
   #Author: Donia Amer Shaarawy 22-0270 
   #it takes in the groupid and the userid and adds the member in the join table
   def addMembers (group_id, user_id)
 	 m = GroupUser.new(:group_id => group_id, :user_id => user_id)
 	 m.save
   end
   #Author: Donia Amer Shaarawy 22-0270 
  #they take the groupid this method is done to return  specific members 
  
 def getGroupMembers(group_id)
   groupmembersid = GroupUser.find(:all, :conditions => {:group_id => group_id})    
 end
end
