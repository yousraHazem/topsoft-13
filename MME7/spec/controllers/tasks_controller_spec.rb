require 'spec_helper'

describe TasksController do

   def valid_attributes
      {:description => 'human resources' , :project_id => 1}
   end
   
   def update_attributes
       {:description => "HR" , :project_id => 1 }
   end

   def invalid_attributes
       {:description => "" , :project_id => "" }
  end

  describe "GET listTask" do
      it "assigns the requested task as @task " do
        task = Task.create! valid_attributes
        get :listTasks, {:id => task.id}
        assigns(:tasks).should eq([task])
      end
    end
 
   
  
 describe "DELETE destroy" do
    it "destroys the requested task" do
      @task = Task.create! valid_attributes
      expect {
        delete :destroy, {:id => @task.to_param}
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the posts list" do
      @task = Task.create! valid_attributes
      delete :destroy, {:id => @task.to_param}
      response.should redirect_to(:action => 'listTasks')
    end
  end

  describe "GET newTask" do
    it "assigns a new task as @task" do
      get :create
      assigns(:task).should be_a_new(Task)
    end
  end

  describe "GET editTask" do
    it "assigns the requested task as @task" do
      task = Task.create! valid_attributes
      get :edit, {:id => task.to_param}
      assigns(:task).should eq(task)
    end
  end

  describe "POST createTask" do
    describe "with valid params" do
      it "creates a new task" do
        expect {
        post :create, {:task => valid_attributes}
        }.to change(Task, :count).by(1)
      end
      it "assigns a newly created task as @task" do
        post :create, {:task => valid_attributes}
        assigns(:task).should be_a(Task)
        assigns(:task).should be_persisted
      end

      it "redirects to the created task " do
        post :create, {:task => valid_attributes}
        response.should redirect_to("http://test.host/tasks/listTasks")
      end
    end
      describe "with invalid params" do
        it "assigns a newly created but unsaved task as @task" do
          # Trigger the behavior that occurs when invalid params are submitted
          Task.any_instance.stub(:save).and_return(false)
          post :create, {:task => invalid_attributes}
          assigns(:task).should be_a_new(Task)
        end
        it "re-renders the 'newTask' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Task.any_instance.stub(:save).and_return(false)
          post :create, {:task => invalid_attributes}
          response.should render_template("create")
        end
      end
  end
  describe "PUT updateTask" do
    describe "with valid params" do
        it "updates the requested task" do
          task = Task.create! valid_attributes
          put :update, {:id => task.to_param, :task => update_attributes }
        end
        it "assigns the requested task as @task" do
          task = Task.create! valid_attributes
          put :update, {:id => task.to_param, :task => valid_attributes}
          assigns(:task).should eq(task)
        end

        it "redirects to the task" do
          task = Task.create! valid_attributes
          put :update, {:id => task.to_param, :task => valid_attributes}
          response.should redirect_to("http://test.host/tasks/listTasks")
        end
    end
    describe "with invalid params" do
        it "assigns the task as @task" do
          task = Task.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Task.any_instance.stub(:save).and_return(false)
          put :update, {:id => task.to_param, :task => invalid_attributes}
          assigns(:task).should eq(task)
        end
        it "re-renders the 'editTask' template" do
          task = Task.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Task.any_instance.stub(:save).and_return(false)
          put :update, {:id => task.to_param, :task => invalid_attributes}
          response.should render_template("edit")
        end
    end
  end
end
