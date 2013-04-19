require 'spec_helper'
#Author : Nayera Mohamed 22-3789
describe ProjectsController do

  def valid_attributes
    {:name => 'proj1a', :start_date => "7/8/2013" , :end_date => "7/8/2014", :description => "blablablablabla"}
  end

  def invalid_attributes
    {:name => 'proj1a', :start_date => "7/8/2013" , :end_date => "3/4/2011", :description => "blablablablabla"}
  end

  def update_attributes
    {:name => 'proj11a', :start_date => "7/8/2013" , :end_date => "7/8/2014", :description => "blablablablabla"}
  end

  describe "GET index" do
    it "assigns all projects as @projects" do
      project = Project.create! valid_attributes
      get :listProjects
     assigns(:projects).should eq([project])
    end
  end

  describe "GET newProject" do
    it "assigns a new project as @project" do
      get :newProject
      assigns(:project).should be_a_new(Project)
    end
  end

  describe "GET editProject" do
    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :editProject, {:id => project.to_param}
      assigns(:project).should eq(project)
    end
  end

  describe "POST createProject" do
    describe "with valid params" do
      it "creates a new project" do
        expect {
          post :createProject, {:project => valid_attributes}
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :createProject, {:project => valid_attributes}
        assigns(:project).should be_a(Project)
        assigns(:project).should be_persisted
      end

      it "redirects to the created project" do
        post :createProject, {:project => valid_attributes}
        response.should redirect_to("http://test.host/projects/show")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        Project.any_instance.stub(:save).and_return(false)
        post :createProject, {:project => invalid_attributes}
        assigns(:project).should be_a_new(Project)
      end

      it "re-renders the 'newProject' template" do
        Project.any_instance.stub(:save).and_return(false)
        post :createProject, {:project => invalid_attributes}
        response.should render_template("newProject")
      end
    end
  end

  describe "PUT updateProject" do
    describe "with valid params" do
      it "updates the requested project" do
        project = Project.create! valid_attributes
        put :updateProject, {:id => project.to_param, :project => update_attributes }
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :updateProject, {:id => project.to_param, :project => valid_attributes}
        assigns(:project).should eq(project)
      end


      it "redirects to the project" do
        project = Project.create! valid_attributes
        put :updateProject, {:id => project.to_param, :@project => valid_attributes}
        response.should redirect_to("http://test.host/projects/show/1")
      end
    end

    describe "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        Project.any_instance.stub(:save).and_return(false)
        put :updateProject, {:id => project.to_param, :project => invalid_attributes}
        assigns(:project).should eq(project)
      end

      it "re-renders the 'editProject' template" do
        project = Project.create! valid_attributes
        Project.any_instance.stub(:save).and_return(false)
        put :updateProject, {:id => project.to_param, :project => invalid_attributes}
        response.should render_template("editProject")
      end
    end
  end
end


