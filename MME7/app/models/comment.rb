class Comment < ActiveRecord::Base

    attr_accessible :post_id , :user_id , :comment 


	belongs_to :user 
	belongs_to :post
 
end
