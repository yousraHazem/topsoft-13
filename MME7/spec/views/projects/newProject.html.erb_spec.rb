require "spec_helper"

describe "stub_model(Project) with a hash of stubs" do
  let(:project) do
    stub_model Project, :name => "Proj1a", :start_date =>"7/8/2013", :end_date => "7/8/2014" , :description => "blablablablabla"
  end
  
  it "stubs :name" do
    project.name.should eql("Proj1a")
  end
  
  
  it "stubs :description" do
    project.description.should eql("blablablablabla")
  end

  it "returns false for new_record? if :id is set" do
    project.should_not be_new_record
  end
  
  it "can be converted to a new record" do
    project.as_new_record
    project.should be_new_record
  end
end