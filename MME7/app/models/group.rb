#encoding: UTF-8
class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :community_id, :user_tokens

  has_many :posts 
  has_many :group_users 
  has_many :users, :through => :group_users
  belongs_to :communities
  validates_presence_of :description, :message => "يرجى إملاء خانة الوصف"
  validates_presence_of :group_name, :message => "يرجى إملاء خانة اسم المجموعة"
  validates_uniqueness_of :group_name, :case_sensitive => false, :message => "هذا الإسم قد أستخدم من قبل"
  validates_presence_of :levels, :message => "يرجى إملاء خانة مستوى المجموعة"

  attr_reader :user_tokens


  #Author: Donia Amer Shaarawy 22-0270 
  #getMembersNotInGroups takes in a paramater group id and then goes to the user table and find all the users that 
  #are not in this group we will subtrack the users in this group from all users this is done by calling on 
  #getGroupMembers(group_id) method. return a list of users

  #def getMembersNotInGroup (group_id)
   #b = GroupUser.getGroupMembers(group_id).collect(&:user_id)
   #return notGroupUser = User.where("id NOT IN (?)" , b)
  #end 


  def getMembersNotInGroup (group_id)
       b = GroupUser.find(:all, :select => "user_id", :conditions => {:group_id => params[:id] }).collect(&:user_id)
       @users = User.where("id NOT IN (?)" , b)
    end 
 
 	def  self.getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
  end

  # Author: May Atef Badr 22-0579
  # This method takes the input the user types in the search field
  # and compares it with the groups' names 
  # if the name matches the input it will list the results of the filtering
  # else it won't list anything
  # Args: group name
  # Returns: searched groups or simular group name/s
  
  def search(search)
    if search
      Group.find(:all, :conditions => ['group_name LIKE ?',"%#{search}%"])
    else 
      Group.find(:all)
    end
  end

  # Author: May Atef Badr 22-0579
  # splites the names of add members
  # Args: user id
  # Returns: user id splited

  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end
end 
