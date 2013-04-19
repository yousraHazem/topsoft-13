class Post < ActiveRecord::Base

    attr_accessible :content , :group_id , :project_id , :user_id
   
	has_many :comments, :dependent => :destroy

	belongs_to :user  

	belongs_to :project
	belongs_to :group 

end
