module CommentsHelper


    #Author: Nayera Mohamed 22-3789 
    # Args : current user and comment id
    # returns : boolean
	def isCommentCreator(current_user , comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end 

end
