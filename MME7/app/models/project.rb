class Project < ActiveRecord::Base
  attr_accessible  :project_name , :start_date , :end_date , :description , :private_or_public , :admin_or_member
	has_many :posts
	has_many :tasks 
	has_and_belongs_to_many :users
	has_one :budget 
	has_many :project_users
	has_many :users , :through => :project_users
end
