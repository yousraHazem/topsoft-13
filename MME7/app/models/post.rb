class Post < ActiveRecord::Base

    attr_accessible :content , :group_id , :project_id , :user_id
	belongs_to :user  
	has_many :comments 
	belongs_to :project
	belongs_to :group 

end
