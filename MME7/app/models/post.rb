class Post < ActiveRecord::Base

	belongs_to :user  #posts creator 
	
	has_many :comments 
	belongs_to :project
  # attr_accessible :title, :body
end
