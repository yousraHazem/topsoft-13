class Post < ActiveRecord::Base
   attr_accessible :content
	belongs_to :user  #posts creator 
	
	has_many :comments 
	belongs_to :project
	belongs_to :group 

end
