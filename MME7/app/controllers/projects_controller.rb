class ProjectsController < ApplicationController
    # include ProjectsHelper
    # include ProjectUsersHelper
    # ProjectUsersHelper :get_projectmembers
     
    # Author : Nayera Mohamed 22-3789 , this method lists the projects  occuring
    def list
    	@projects = Project.all
    end
     
    # Author : Nayera Mohamed 22-3789 , this method shows the projects  occuring
    def show
      @project_id = params[:id]
    	@project = Project.find(params[:id])
    end


    ## Author : Nayera Mohamed 22-3789 , this method puts a new project
    def new
    	@project = Project.new
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

    # def addMem
    #  @projectuser = ProjectUser.new(params[:projectuser] )
    #    if @projectuser.save
    #     flash[:notice]= "project created"
    #       redirect_to(:action => 'list')

    #     else
    #        render('new')
    #     end
    # end


    # authorized by sarah ahmed id:22-1278
    #gets the project that need to be edited
    def edit
      @project = Project.find(params[:id])
    end


    # authorized by sarah ahmed id:22-1278
    #update the selected project with the new submitted values
    def update
        @project = Project.find(params[:id])

      if @project.update_attributes(params[:project])
        flash[:notice] = "Project successfully updated"
        #redirect_to(:action=>'ed', :id=>)
        render('edit')
      else
         flash[:notice] = "Project could not be updated"
         # render('edit')
      end
    end

     def addMembers2
      # @theuser = User.find(params[:user_id])
      @project_id= params[:id]
      @user_id= params[:user_id]
      @newUser = ProjectUser.new(:project_id => @project_id , :is_creator => false)

      if @newUser.save
        flash[:notice] = "User successfully added"
      else 
        flash[:notice] = "User failed to be added"
      end
        redirect_to(:action => 'show', :id => params[:id])
    end
end
