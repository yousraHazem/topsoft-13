require 'spec_helper'
require 'parsedate'

describe Project do

  before(:each) do
    @project = { :project_name => "Proj1a", :start_date =>"7/8/2013", :end_date => "7/8/2014" , :description => "blablablablabla"  }
  end

  it "should create a new instance given a valid attribute" do
    Project.create!(@project)
  end

  it "should require a name" do
    no_name_project = Project.new(@project.merge(:project_name => ""))
    no_name_project.should_not be_valid
  end

  it "should reject duplicate project names" do
    Project.create!(@project)
    project_with_duplicate_project_name = Project.new(@project)
    project_with_duplicate_project_name.should_not be_valid
  end

  describe "when end date before start date" do
    before { :end_date <  :start_date}
    it { should_not be_valid }
  end

   # describe "when start date before current date" do
   #   current_date = DateTime.now
     
   #   before {  ("7/8/2013" ) < current_date}
   #   it { should_not be_valid }
   # end

 
end