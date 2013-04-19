class TasksController < ApplicationController
    # Author : Nayera Mohamed 22-3789 , this method shows the tasks of a certain project
	def listTasks
		@tasks = Task.where(:project_id=>params[:id])
	end

end
