class Project < ActiveRecord::Base
  attr_accessible  :name , :start_date , :end_date , :description 
	has_many :posts
	has_many :tasks 
	has_and_belongs_to_many :users
	has_one :budget 
	has_many :project_users
	has_many :users , :through => :project_users
	has_and_belongs_to_many :communities
		has_many :budget_source_projects
	has_many :budget_sources , :through => :budget_source_projects
end
