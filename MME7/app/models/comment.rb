class Comment < ActiveRecord::Base

    attr_accessible :post_id , :user_id , :comment 
    #Author : Nayera Mohamed 22-3789, this method takes the user id and the comment id and reutrns a boolean stating whether this is the comment creator or not
    def isCommentCreator(current_user, comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end

	belongs_to :user #comments creator
	belongs_to :post
 
end
