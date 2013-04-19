require "spec_helper"
#Author : Nayera Mohamed 22-3789
describe "projects/editProject.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project))
  end

  it "renders the form partial" do
    stub_template "projects/_form.html.erb" => "This content"
    render
    rendered.should =~ /This content/
  end
end