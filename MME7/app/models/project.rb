class Project < ActiveRecord::Base
  attr_accessible  :project_name , :start_date , :end_date , :description , :private_or_public , :admin_or_member, :user_tokens
	has_many :posts
	has_many :tasks 
	has_and_belongs_to_many :users
	has_one :budget 
	has_many :project_users
	has_many :users , :through => :project_users
	attr_reader :user_tokens

	def get_projectmembers(project_id)
 	 @projectmembersid = ProjectUser.find(:all, :conditions => {:project_id => project_id })
  	end

	# def getMembersNotInProject()
	#  # a = User.find(:all)
	#  @b = ProjectUser.get_projectmembers(:project_id)
	#  @notProjectUser = User.find(:all, :conditions => :user_id != @b)
	#  end 

	  def user_tokens=(ids)
	  	self.user_ids = ids.split(",")
	  end

end
