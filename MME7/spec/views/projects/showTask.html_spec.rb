require 'spec_helper'

describe "projects/showTask" do
  it "displays the project" do
    assign(:task, stub_model(Task, :description => 'human resources' , :project_id => 1))
    render
  end
end