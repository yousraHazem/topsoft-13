class Post < ActiveRecord::Base
	validates_presence_of  :content 
    
    attr_accessible :content , :group_id , :project_id
	belongs_to :user  #posts creator 
	has_many :comments 
	belongs_to :project
	belongs_to :group 

end
