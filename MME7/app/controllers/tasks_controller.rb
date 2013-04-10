class TasksController < ApplicationController

	def listTasks
		@tasks = Task.where(:project_id=>params[:id])
	end
end
