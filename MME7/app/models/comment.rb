class Comment < ActiveRecord::Base


    attr_accessible :post_id , :user_id , :comment 
	belongs_to :user #comments creator
	belongs_to :post #fakarini a3mel dep destroy
	validates_presence_of :comment

 
end
