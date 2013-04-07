require 'spec_helper'
describe Task do
	describe '.get_tasks' do
     get :get_tasks
   it "loads all of the tasks into @tasks" do
 	t1 = Task.create!(project_id: 1)
    t2 = Task.create!(project_id: 1)
    t3 = Task.create!(project_id: 2)
      expect(assigns(:tasks)).to match_array([t1, t2])
  end
end 
end