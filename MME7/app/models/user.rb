class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :posts
  has_many :comments
  belongs_to :task
  has_and_belongs_to_many :groups 
  has_and_belongs_to_many :projects
  belongs_to :projects #project creators 
end
