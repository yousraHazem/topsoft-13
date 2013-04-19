class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels


  has_many :posts 
  has_many :groups_users 
  belongs_to :communities
  validates_presence_of :description
  validates_presence_of :group_name
  validates_uniqueness_of :group_name, :case_sensitive => false

	
  #Author: Donia Amer Shaarawy 22-0270 
  #getMembersNotInGroups takes in a paramater group id and then goes to the user table and find all the users that 
  #are not in this group we will subtrack the users in this group from all users this is done by calling on 
  #getGroupMembers(group_id) method. return a list of users
  def getMembersNotInGroup (group_id)
   b = Group.getGroupMembers(group_id).collect(&:user_id)
   return notGroupUser = User.where("id NOT IN (?)" , b)
  end 
 
 	def  self.getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
  end
end 
