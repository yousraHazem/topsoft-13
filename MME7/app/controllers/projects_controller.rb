class ProjectsController < ApplicationController
    
    # Author : Nayera Mohamed 22-3789 , this method lists the projects  occuring
    def list
      @projects = Project.all
    end
     
    # Author : Riham Gamal 22-3781 , this method shows the projects  of the user
    def show
      @project_id = params[:id]
      @project = Project.find(params[:id])
    end



    
    # Author : Nayera Mohamed 22-3789 , this method creates a project

    def create
     @project=Project.new(params[:project])
       if @project.save
        flash[:notice]= "project created"
          redirect_to(:action => 'show', :id => @project.id)
        else
           render('new')
        end
    end

end