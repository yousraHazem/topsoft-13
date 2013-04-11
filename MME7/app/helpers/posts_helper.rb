module PostsHelper

   
	def isPostCreator(current_user, current_post)
        Post.where(:user_id => current_user, :id => current_post).exists?  
    end 
 


end
