class Comment < ActiveRecord::Base

    attr_accessible :post_id , :user_id , :comment 

 attr_accessible :comment

	belongs_to :user #comments creator
	belongs_to :post
 
end
