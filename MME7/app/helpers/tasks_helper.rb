module TasksHelper
	#Authored by Toka Omar  id:22-1925
  	#this method takes input :project id and outputs: tasks that have the same project id entered 
	def get_tasks (p_id)
	return Task.find(:all, :conditions => {:project_id =>p_id})
    end
end
