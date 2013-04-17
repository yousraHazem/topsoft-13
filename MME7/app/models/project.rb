class Project < ActiveRecord::Base
  attr_accessible  :project_name , :start_date , :end_date , :description , :private_or_public , :admin_or_member
	has_many :posts
	has_many :tasks 
	has_and_belongs_to_many :users
	has_one :budget 
	has_many :project_users
	has_many :users , :through => :project_users
	has_many :budget_items
	has_and_belongs_to_many :communities
	has_and_belongs_to_many :budget_sources
	has_many :budget_source_projects
	has_many :budget_sources , :through => :budget_source_projects
	attr_reader :user_tokens

	def self.get_projectmembers(project_id)
 	 @projectmembersid = ProjectUser.find(:all, :select => "user_id", :conditions => {:project_id => project_id }).collect(&:user_id)
  	end


   
	def user_tokens=(ids)
	  self.user_ids = ids.split(",")
	end
	#Author: Donia Amer Shaarawy 22-0270 
    #getMembersNotInProject takes in a paramater project id and then goes to the user table and find all the users that 
    #are not in this project we will subtrack the users in this project from all users this is done by calling on 
    #get_projectmembers(project_id) method. this is taken from nayera 
    def getMembersNotInProject (project_id)
       b = ProjectUser.find(:all, :select => "user_id", :conditions => {:project_id => params[:id] }).collect(&:user_id)
      @users = User.where("id NOT IN (?)" , b)
    end 
end
    
