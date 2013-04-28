class TasksController < ApplicationController
	class TasksController < ApplicationController
    # Author : Nayera Mohamed 22-3789 
    #Args : task params
    #returns: list of tasks
	def listTasks
		@tasks = Task.where(:project_id=>params[:id])
	end

end
end

