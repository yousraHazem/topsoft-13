
module PostsHelper
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :group id and outputs: posts that have the same group id entered 
	def getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
    end

end
