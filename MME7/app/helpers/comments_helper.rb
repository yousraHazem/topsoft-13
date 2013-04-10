module CommentsHelper

    #Author: Nayera Mohamed 22-3789 , this method sees whether if the this is the comment creator or not

	

	def isCommentCreator(user_id, comment_id)
        Comment.where(:user_id => user_id, :comment_id => comment_id).exists?
    end 
 

end
