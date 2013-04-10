class Comment < ActiveRecord::Base

    attr_accessible :post_id , :user_id , :comment 

    def isCommentCreator(current_user, comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end

	belongs_to :user #comments creator
	belongs_to :post
 
end
