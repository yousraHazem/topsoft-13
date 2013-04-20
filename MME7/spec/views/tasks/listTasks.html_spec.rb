require 'spec_helper'
# Author : Nayera Mohamed 22-3789

describe "tasks/listTasks.html" do
  it "renders the task partial for each project" do
    assign(:tasks,[
      mock_model(Task, :description => 'pr' , :project_id => 1),
      mock_model(Task, :description => 'hr' , :project_id => 2)
    ])
    render
    rendered.should =~ /pr/
    rendered.should =~ /hr/

  end
end