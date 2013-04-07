module PostsHelper
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :group id and outputs: posts that have the same group id entered 
	def getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
    end

    #Authored by Mariam Ismil id:22-3456
    #this method checks if the user is the creator of the post or not and takes as parameter the current user and the current post

	def isPostCreator(current_user, current_post)
        Post.where(:user_id => current_user, :id => current_post).exists?  
    end 
 


end
