class Group < ActiveRecord::Base
  attr_accessible :group_name , :description , :levels , :user_id , :community_id

  has_many :posts 
  has_and_belongs_to_many :users
  has_many :groups_users 
  has_many :users , :through => :group_users


	#Authored by Toka Omar  id:22-1925
  	#this method takes input :group id and outputs: posts that have the same group id entered 
	def getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
    end


end 
