class Project < ActiveRecord::Base

	has_many :posts
	has_many :users #project creators 
	has_many :tasks 
	has_and_belongs_to_many :users
	has_one :budget 
  # attr_accessible :title, :body
end
