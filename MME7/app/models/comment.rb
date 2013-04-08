class Comment < ActiveRecord::Base

    attr_accessible :post_id , :user_id , :comment 
    # Author : Nayera Mohamed 22-3789 , this method takes as an input a user id and sees whether this user has made this comment or not (returns boolean)
    def isCommentCreator(current_user)
        Comment.where(:user_id => current_user).exists?  
    end

	belongs_to :user #comments creator
	belongs_to :post
 
end
