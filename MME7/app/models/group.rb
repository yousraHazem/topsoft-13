class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :community_id


  has_many :posts 
  has_many :groups_users 
  has_many :users , :through => :group_users

	
  #Author: Donia Amer Shaarawy 22-0270 
  #getMembersNotInGroups takes in a paramater group id and then goes to the user table and find all the users that 
  #are not in this group we will subtrack the users in this group from all users this is done by calling on 
  #getGroupMembers(group_id) method.
  def getMembersNotInGroup (group_id)
   b = Group.getGroupMembers(group_id).collect(&:user_id)
   return notGroupUser = User.where("id NOT IN (?)" , b)
  end 
end 
