module TasksHelper
	module TasksHelper
	def get_tasks (p_id)
	#Authored by Toka Omar  id:22-1925
  	#this method takes input from the user the id of the project
	#then it  finds task with that project id 
	#then returns the tasks with that specified id  
	return Task.find(:all, :conditions => {:project_id =>p_id})
    end
end
