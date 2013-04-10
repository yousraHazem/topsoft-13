require 'spec_helper'

describe "projects/showProject" do
  it "displays the project" do
    assign(:project, stub_model(Project, :project_name => "Proj1a", :start_date =>"7/8/2013", :end_date => "7/8/2014" , :description => "blablablablabla" ))
    render
  end
end