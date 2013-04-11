class User < ActiveRecord::Base

  attr_accessible :name, :email , :phone_Nr , :address , :password , :isAdmin , :task_id

  has_many :posts
  has_many :comments
  belongs_to :task
  belongs_to :group
  has_and_belongs_to_many :budget_items
  has_many :project_users
  has_many :projects , :through => :project_users

  has_many :groups_users 
  has_many :groups , :through => :group_users 

  def self.getMembersNotInProject (project_id)
     b = get_projectmembers(project_id)
     return notProjectUser = User.where("id NOT IN (?)" , b)
  end 


end
