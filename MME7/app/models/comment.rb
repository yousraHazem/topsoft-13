class Comment < ActiveRecord::Base

<<<<<<< HEAD

    attr_accessible :post_id , :user_id , :comment 
	belongs_to :user #comments creator
=======
    attr_accessible :post_id , :user_id , :comment 


	belongs_to :user 
>>>>>>> ee79f9796525e283f8d46ea67f9a1461f9865a94
	belongs_to :post
	validates_presence_of :comment

 
end
