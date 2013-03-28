module CommentsHelper

<<<<<<< Updated upstream
    #seeing whether if the this is the comment creator or not
	def isCommentCreator(user_id, comment_id)
	commentCreator = Comment.where(:comment_id => comment_id, :user_id => user_id, :is_creator => true).exists?
	if commentCreator == true
		return true
	else 
		return false 
	end 
	end 
=======
    #Author: Nayera Mohamed 22-3789 , this method sees whether if the this is the comment creator or not
	
	def isCommentCreator(current_user, comment_id)
        Comment.where(:user_id => current_user, :comment_id => comment_id, :is_creator => true).exists?  
    end 
 
>>>>>>> Stashed changes

end
