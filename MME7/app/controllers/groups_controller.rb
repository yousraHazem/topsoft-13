class GroupsController < ApplicationController

<<<<<<< HEAD
    def index
        @groups = Group.order("groups.group_name ASC")
    end

    # Author: Sama Akram 22-555 As a system I can delete a group, destroying method
    #def destroy
        #@group = Group.destroy(params[:id])
        #rescue ActiveRecord::RecordNotFound
        #@group.destroy
        #respond_to do |format|
            #format.html { redirect_to('index') }
        #end
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
=======
	
>>>>>>> 55f488d4b099d470c2a679f23f16d07524369907
end

  end 

