class ProjectUsersController < ApplicationController

      def addMembers
      @project_id= params[:id]
      
      #@projectmembersid=ProjectUser.find(:all, :conditions => {:project_id => @project_id })
      #@assignedppl  = ProjectUser.find(:all, :conditions=>{:project_id=>@project_id})
      @assigned  = ProjectUser.find(:all,:select=>"user_id", :conditions=>{:project_id=>@project_id}).collect(&:user_id)
       if @assigned.empty?
        @users = User.find(:all)
       else
        #@user = User.find(:all)
        @users = User.where("id NOT IN (?)", @assigned)
      end
       #@users = User.find(:all)

      #@new = TaskUser.find(:all , :conditions => {:task_id => @task_id , :user_id =>@user , :assigned = false})
    end



    # def addMembers
    #   # @projectmembersid = ProjectUser.where(:project_id => params[:id])
    #   # @notProjectUser = User.find(:all, :conditions => :user_id != @projectmembersid)
    #   #@project = Project.find(params[:id])
    #   #@users = @project.get_projectmembers(params[:id])
    #   @project_id= params[:id]

    #   b = ProjectUser.find(:all, :select => "user_id", :conditions => {:project_id => params[:id] }).collect(&:user_id)
    #   @users = User.where("id NOT IN (?)" , b)
    #   #@users = Project.getMembersNotInProject(params[:id])
    #   end    

 
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
