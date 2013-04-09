class Post < ActiveRecord::Base
    attr_accessible :content , :group_id , :project_id
	belongs_to :user  #posts creator 
	has_many :comments 
	belongs_to :project
	belongs_to :group
	validates_presence_of :content

	def self.getPostComments(post_id)
 	     @posts = Post.find(:all, :conditions => {:post_id => post_id })
    end 

end
