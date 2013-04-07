class GroupsController < ApplicationController

    def index
        @groups = Group.order("groups.id")
    end

    # Author: Sama Akram 22-555 As a system I can delete a group, destroying method
    #def destroy
        #@group = Group.find(params[:id])
        #rescue ActiveRecord::RecordNotFound
        #@group.destroy
        #render 'index'
    #end

    # Author: Sama Akram 22-555 As a system I can delete a group, delete method
    #def delete
        #@group = Group.find(params[:id])
        #rescue ActiveRecord::RecordNotFound
    #end

    def show
        @group = Group.find(params[:id])
        rescue ActiveRecord::RecordNotFound
    end

    # Author: Sama Akram 22-555 As a system I can create a group, calls when clicked on create new group
    def new
        @group = Group.new
    end

    # Author: Sama Akram 22-555 As a system I can create a group, calls after new method to save into db
    def create
        @group = Group.new(params[:group])
        if @group.save
            #@group.isGroupCreator(current_user.id) == 'true'
            render ('create')
        else
            render ('new')
        end
    end

    #Author May Badr 22-0579
    #finds the resord to be edited
    def edit
        @group = Group.find(params[:id])
    end

    # Author May Badr 22-0579
    # updates the chosen record and returns to the list if succeeded and flashes a msg
    # and if not will flash a msg of failure and returns to edit page
    def update
        @group = Group.find(params[:id])
        
        if @group.update_attributes(params[:group])
            flash[:notice] = "Group successfully updated"
            redirect_to(:action => 'index')
        else
            flash[:notice] = "Group could not be updated"
            redirect_to(:action => 'edit')
        end
    end

   
end
