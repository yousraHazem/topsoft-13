
﻿class GroupUser < ActiveRecord::Base
   attr_accessible :group_id , :user_id , :is_creator
  belongs_to :group 
  belongs_to :user


  def self.getGroupMembers(group_id)
  	groupmembersid = GroupUser.find(:all, :conditions => {:group_id => group_id}) 	
  end

  def getMembersNotInGroup(group_id)
   b = GroupUser.getGroupMembers(group_id)
   notGroupUser = User.find(:all, :conditions => :user_id != b)
  end 

end