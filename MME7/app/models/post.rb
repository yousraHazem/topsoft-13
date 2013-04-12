# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  group_id   :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
    attr_accessible :content , :group_id , :project_id
	belongs_to :user  #posts creator 
	has_many :comments, :dependent => :destroy
    attr_accessible :content , :group_id , :project_id , :user_id
	belongs_to :user  
	has_many :comments 
	belongs_to :project
	belongs_to :group
	validates_presence_of :content


	def self.getPostComments(post_id)
 	     @posts = Post.find(:all, :conditions => {:post_id => post_id })
    end 


 	def  self.getcomments (p_id)
	return Comment.find(:all, :conditions => {:post_id =>p_id})
    end

end
    
