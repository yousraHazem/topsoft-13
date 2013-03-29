module CommentsHelper

    #Author: Nayera Mohamed 22-3789 , this method sees whether if the this is the comment creator or not

	
	def isCommentCreator(current_user)
        Comment.where(:user_id => current_user).exists?  
    end 
 

end
