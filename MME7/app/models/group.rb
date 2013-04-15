class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :community_id



  has_many :posts 
  has_many :groups_users 
  has_many :users, :through => :group_users
  belongs_to :communities
  validates_presence_of :description
  validates_presence_of :group_name
  validates_uniqueness_of :group_name, :case_sensitive => false


 
 	def  self.getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
  end
end 
