module CommentsHelper

<<<<<<< HEAD

    #Author: Nayera Mohamed 22-3789 , this method takes the current user id as input and sees if this is the person who actually did this comment or not

	def isCommentCreator(current_user , comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  


    end 
=======
    #Author: Nayera Mohamed 22-3789 , this method sees whether if the this is the comment creator or not

	
	def isCommentCreator(current_user, comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end 
 

>>>>>>> master

end
