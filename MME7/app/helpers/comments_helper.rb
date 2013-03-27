module CommentsHelper

    #seeing whether if the this is the comment creator or not
	def isCommentCreator(user_id, comment_id)
	commentCreator = Comment.where(:comment_id => comment_id, :user_id => user_id, :is_creator => true).exists?
	if commentCreator == true
		return true
	else 
		return false 
	end 
	end 

end
