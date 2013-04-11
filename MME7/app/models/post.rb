class Post < ActiveRecord::Base
    attr_accessible :content , :group_id , :project_id
	belongs_to :user  #posts creator 
	has_many :comments 
	belongs_to :project
	belongs_to :group 
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :group id and outputs: posts that have the same group id entered 
	def getposts
	post = Post.find(:all, :conditions => {:group_id =>1})
    end

end
