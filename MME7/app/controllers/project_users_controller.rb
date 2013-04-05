class ProjectUsersController < ApplicationController

    def addMembers
      # @projectmembersid = ProjectUser.where(:project_id => params[:id])
      # @notProjectUser = User.find(:all, :conditions => :user_id != @projectmembersid)
      #@project = Project.find(params[:id])
      #@users = @project.get_projectmembers(params[:id])
      @project_id= params[:id]
      @users = User.find(:all)
      end    

 
    def addMembers2
      # @theuser = User.find(params[:user_id])
      @project_id= params[:project_id]
      @user_id= params[:user_id]
      @newUser = ProjectUser.new(:project_id => @project_id , :user_id => @user_id, :is_creator => false)

      if @newUser.save
        flash[:notice] = "User successfully added"
      else 
        flash[:notice] = "User failed to be added"
      end
        redirect_to(:action => 'addMembers', :id => @project_id)
    end
end
