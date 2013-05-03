require 'spec_helper'

describe TaskUsersController do
	 def valid_attributes
      {:task_id => 1 , :user_id => 1}
   end
describe "unassign task to member" do
    it "destroys the requested task" do
      @task = TaskUser.create! valid_attributes
      expect {
        delete :unassign, {:id => @task.to_param}
      }.to change(TaskUser, :count).by(-1)
    end
end

end
