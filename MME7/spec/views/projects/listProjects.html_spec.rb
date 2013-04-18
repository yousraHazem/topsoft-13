require "spec_helper"
#Author : Nayera Mohamed 22-3789
describe "projects/listProjects.html" do
  it "renders the project partial for each project" do
    assign(:projects,[
      mock_model(Project, :name => 'proj11aa', :start_date => "7/8/2013" , :end_date => "7/8/2014", :description => "blablablablabla"),
      mock_model(Project, :name => 'proj11bba', :start_date => "7/8/2013" , :end_date => "7/8/2014", :description => "blablablablabla")
    ])
    render
    rendered.should =~ /proj11aa/
    rendered.should =~ /proj11bba/

  end
end