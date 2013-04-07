module PostsHelper
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :group id and outputs: posts that have the same group id entered 
	def getposts (g_id)
	return Post.find(:all, :conditions => {:group_id =>g_id})
    end


    # Author :Salma El Ruby 22-4649 This method checks if the current user is a creator of the post he is trying to access 
  def isCreator(current_user, post_id)
  ProjectUser.where(:user_id => current_user, :post_id => post_id, :is_creator => true).exists?  
 end 
end
