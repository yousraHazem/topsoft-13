require 'spec_helper'
describe ProjectsController do

  def valid_attributes
    {:name => 'proj', :start_date => "7/7/2013" , :end_date => "7/8/2014", :description => "blablablablabla"}
  end

  def invalid_attributes
    {:name => 'proj', :start_date => "7/7/2013" , :end_date => "3/4/2011", :description => "blablablablabla"}
  end

  def update_attributes
    {:name => 'proj', :start_date => "7/7/2013" , :end_date => "7/8/2014", :description => "blablablablabla"}
  end

   #Riham Gamal Hamed 22-3871
   describe "GET show" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :show, {:id => project.to_param}
      assigns(:project).should eq(project)
    end
  end

end