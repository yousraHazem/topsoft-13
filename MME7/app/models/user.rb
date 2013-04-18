class User < ActiveRecord::Base

 #Author: Donia Amer Shaarawy 22-0270
  #these are the attributes needed for a user also though are out valdiations that are need for the input of sign up 
  attr_accessible :address, :email, :name, :isAdmin, :phone_Nr, :username, :password, :password_confirmation
  has_secure_password


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

