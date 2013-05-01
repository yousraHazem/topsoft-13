require 'spec_helper'


describe BudgetSourceProjectsController do

let(:project) {Project.create(:name => "Proj1a", :start_date =>"7/8/2013", :end_date => "7/8/2014" , :description => "blablablablabla"  )}

let(:budget_sources){BudgetSource.create(:name => "Pepsi", :amount => 1000)}

	def valid_attributes
        {:project_id => project.id, :budget_source_id => budget_sources.id ,:amount => 1000}
	end



	describe "GET sourceproject" do
      it "assigns all sources as @budget_sources" do
      	budget_sources = BudgetSourceProject.create! valid_attributes
      	project = Project.new
      Project.should_receive(:find).and_return(project)
      	get :sourceproject , { :project_id => 1}
      	assigns(:budget_sources).should eq([budget_sources])
      end

    end  

end