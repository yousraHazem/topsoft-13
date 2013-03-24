class Post < ActiveRecord::Base
	belongs_to :user  #posts creator 
	
	has_many :comments 
	belongs_to :project
	belongs_to :group 

  # attr_accessible :title, :body
end
