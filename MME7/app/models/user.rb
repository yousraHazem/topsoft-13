class User < ActiveRecord::Base


  attr_accessible :name, :email , :phone_Nr , :address , :username , :password , :isAdmin , :id




  has_many :posts
  has_many :comments
  belongs_to :task
  belongs_to :group
  has_and_belongs_to_many :budget_items
  has_many :project_users
  has_many :projects , :through => :project_users

  has_many :groups_users 
  has_many :groups , :through => :group_users 

  has_many :task_users
  has_many :tasks , :through => :task_users





end
