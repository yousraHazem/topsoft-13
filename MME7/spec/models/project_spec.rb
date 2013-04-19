require 'spec_helper'

#Author : Nayera Mohamed 22-3789

describe Project do

  before(:each) do
    @project = { :name => "Proj1a", :start_date =>"7/8/2013", :end_date => "7/8/2014" , :description => "blablablablabla"  }
  end

  it "should create a new instance given a valid attribute" do
    Project.create!(@project)
  end

  it "should require a name" do
    no_name_project = Project.new(@project.merge(:name => ""))
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

  it "should see whether th project has budget sources" do
     project = Project.new(:name => "Project1", :start_date => "7/8/2013" , :end_date => "7/8/2014" , :description => "blablabla" )
     project.save
     projectid = project.id
     budgetItem = BudgetItem.new(:name => "budgetItem", :operational => false , :task_id => 1 ,  :total => 0, :spent => 100 , :project_id => projectid)
     budgetItem.save
     budgetItemid= budgetItem.id
     project.budgetItems(projectid)
  end

  it "should see whether th project has budget sources" do
     project = Project.new(:name => "Project1", :start_date => "7/8/2013" , :end_date => "7/8/2014" , :description => "blablabla" )
     project.save
     projectid = project.id
     budgetSourceProject = BudgetSourceProject.new(:budget_source_id => 1 , :project_id => projectid, :amount => 0)
     budgetSourceProject.save
     budgetSourceProjectid= budgetSourceProject.id
     project.budgetSourceProject(projectid)
  end

 
end