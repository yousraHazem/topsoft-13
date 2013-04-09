require 'spec_helper'
describe TasksController do

	 def valid_task_attributes
	    {:description => 'human resources' , :project_id => 1}
	 end


	describe "GET listTask" do
	    it "assigns the requested task as @task " do
	      task = Task.create! valid_task_attributes
	      get :listTasks, {:id => task.id}
	      assigns(:tasks).should eq([task])
	    end
	  end

 end 
 
