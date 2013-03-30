module PostsHelper
	def getposts (g_id)
	#Authored by Toka Omar id:22-1925
	#this method takes input from the user the id of their group and find 
	#the post that has this group id 
	#then returns the posts with that specified id  
	return Post.find(:all, :conditions => {:group_id =>g_id})
    end
end
