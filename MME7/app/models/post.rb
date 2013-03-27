class Post < ActiveRecord::Base
   attr_accessible :content
	belongs_to :user  #posts creator 
	
	has_many :comments 
	belongs_to :project
	belongs_to :group 

	def getposts (int g_id)
	#this method takes input from the user the id of their group and find 
	#the post that has this group id 
	#then returns the posts with that specified id  
	#by Toka Omar
    @posts = Post.find(:all, :conditions => { :group_id => g_id })
    end
end
