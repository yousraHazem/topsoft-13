
module PostsHelper
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :group id and outputs: posts that have the same group id entered 
	def getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
    end
 



    
  # Author : Salma El -Ruby 22-4649
  # Args : takes current_user,post_id
  # Returns : boolean
  # Explanation : this method checks if the current_user is the creator of the post 
  def isPostCreator(current_user , post_id)
        Comment.where(:user_id => current_user, :id => postt_id).exists?  

    end 
end
