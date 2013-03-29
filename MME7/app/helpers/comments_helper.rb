module CommentsHelper
    #Author: Nayera Mohamed 22-3789, this method sees whether if the this is the comment creator or not
	
	def isCommentCreator(current_user)
        @creator = Comment.find(:all, :conditions=> {:user_id => current_user.id, :comment_id => params[:id]})
          if @creator = nil
             return false
          else
             return true
      
          end
    end      

end
