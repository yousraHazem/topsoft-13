#encoding: UTF-8
class Comment < ActiveRecord::Base
    attr_accessible :post_id , :user_id , :comment, :is_group, :name
    belongs_to :user 
    belongs_to :post

    validates_presence_of :comment, :message => "يجب ألا تكون خالية "

   #Author: Nayera Mohamed 22-3789 
    # Args : current user and comment id
    # returns : boolean
    def isCommentCreator(current_user, comment_id)
        Comment.where(:user_id => current_user, :id => comment_id).exists?  
    end

end
