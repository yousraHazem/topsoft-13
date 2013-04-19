class Comment < ActiveRecord::Base
  attr_accessible :post_id , :user_id , :comment 

    
	belongs_to :user #comments creator
  belongs_to :post
	validates_presence_of :comment

   #Author: Nayera Mohamed 22-3789 
    # Args : current user and comment id
    # returns : boolean
    def isCommentCreator(current_user, comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end


end
