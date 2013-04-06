class Post < ActiveRecord::Base
    attr_accessible :content , :group_id , :project_id
	belongs_to :user  #posts creator 
	has_many :comments 
	belongs_to :project
	belongs_to :group

	def self.getProjectPosts(project_id)
 	     @projectposts = Post.find(:all, :conditions => {:project_id => project_id })
    end 

end
