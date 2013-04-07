class Task < ActiveRecord::Base
  attr_accessible :description , :project_id
has_one :budget_item 
  has_many :users 
  belongs_to :project 
   #Authored by Toka Omar  id:22-1925
  	#this method takes input :project id and outputs: tasks that have the same project id entered 
	def get_tasks
	@tasks = Task.find(:all, :conditions => {:project_id =>1})
    end
end
