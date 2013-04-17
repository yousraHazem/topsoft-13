class Comment < ActiveRecord::Base

    attr_accessible :post_id , :user_id , :comment 
    belongs_to :user 
	belongs_to :post
 
    #Author: Nayera Mohamed 22-3789 
    # Args : current user and comment id
    # returns : boolean
	def isCommentCreator(current_user , comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end 
	
end
