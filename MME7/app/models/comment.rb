class Comment < ActiveRecord::Base
  attr_accessible :post_id , :user_id , :comment 

	belongs_to :user #comments creator
	belongs_to :post

	validates_presence_of :comment
   
    # Author : Nayera Mohamed 22-3789 , this project takes user and comment id and returns a boolean if this user is the comment creator or not
    def isCommentCreator(current_user, comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end


end
