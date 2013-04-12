<<<<<<< HEAD
﻿class GroupsController < ApplicationController

def index
        @groups = Group.order("groups.group_name ASC")
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
=======
class GroupsController < ApplicationController
include GroupUsersHelper

    # Author: Sama Akram 22-555, it gets all groups ordered alphabetically by group name
    def index
        @groups = Group.order("groups.group_name ASC")
    end

    # Author: Sama Akram 22-555 
    # As a system/admin/creator I can delete a group, destroying method issue #160
    # finds the current group_id and deletes its record from db
    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to :action => 'index'
    end

    # Author: Sama Akram 22-555
    # finds the group_id i want to view
    def show
        @group_id = params[:id]
        @group = Group.find(params[:id])
        @postlist=Group.getposts (params[:id])
    end

    # Author: Sama Akram 22-555
    # As a system I can create a group, called when clicked on create new group
>>>>>>> master
    def new
        @group = Group.new
    end

<<<<<<< HEAD
    # Author: Sama Akram 22-555 As a system I can create a group, calls after new method to save into db
    def create
        @group = Group.new(params[:group])
        if @group.save
            #@group.isGroupCreator(current_user.id) == 'true'
            render ('create')
        else
=======
    # Author: Sama Akram 22-555
    # As a system/admin/member I can create a group issue #157 
    # creates new group and if saved into db it creates a new record in GroupUser
    # with currend user_id & and current group_id then sets att. isCreator = true since he's the creator
    def create
        @group = Group.new(params[:group])
        if @group.save
            @m = GroupUser.new(:group_id => @group.id, :user_id => 1)
            @m.isCreator = 'true'
            @m.save
            flash[:notice] = "Congratulations, you have successfully created a group"
            redirect_to :action => 'index'
        else
            flash[:error] = "Please make sure to fill in the required fields * OR you might have chosen an already existing group name"
>>>>>>> master
            render ('new')
        end
    end
end

<<<<<<< HEAD
﻿
>>>>>>> master
=======
>>>>>>> master
