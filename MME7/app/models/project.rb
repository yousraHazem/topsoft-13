class Project < ActiveRecord::Base
  attr_accessible  :name , :start_date , :end_date , :description 
	has_many :posts
	has_many :tasks 
	has_and_belongs_to_many :users
	has_one :budget 
	has_many :project_users
	has_many :users , :through => :project_users
	has_and_belongs_to_many :communities
	has_and_belongs_to_many :budget_sources
    has_many :budget_source_projects
    has_many :budget_sources , :through => :budget_source_projects
	attr_reader :user_tokens

	def self.get_projectmembers(project_id)
 	 @projectmembersid = ProjectUser.find(:all, :select => "user_id", :conditions => {:project_id => project_id }).collect(&:user_id)
  	end


    def getMembersNotInProject (project_id)
     b = Project.get_projectmembers(project_id)
     return notProjectUser = User.where("id NOT IN (?)" , b)
    end 


	def user_tokens=(ids)
	  self.user_ids = ids.split(",")
	end

	def self.getProjectPosts(project_id)
 	     @projectposts = Post.find(:all, :conditions => {:project_id => project_id })
    end 
    
end
