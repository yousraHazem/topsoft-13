class Task < ActiveRecord::Base
  attr_accessible :description
has_one :budget_item 
  has_many :users 
  belongs_to :project 
    def get_tasks (int p_id)
	#this method takes input from the user the id of the project
	#then it  finds task with that project id 
	#then returns the posts with that specified id  
	#by Toka Omar
    @posts = Post.find(:all, :conditions => { :project_id => p_id })
    end
end
