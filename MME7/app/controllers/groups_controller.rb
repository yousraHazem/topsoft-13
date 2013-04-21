#encoding: UTF-8
class GroupsController < ApplicationController
include GroupUsersHelper

    # Author: Sama Akram 22-555, it gets all groups ordered alphabetically by group name
    # returns Group.all ordered by name
    def index
        @groups = Group.order("groups.group_name ASC")
    end

    # Author: Sama Akram 22-555 
    # As a creator I can delete a group, destroying method issue #160
    # ARGS the group_id and deletes its record from db
    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        redirect_to :action => 'index'
    end

    # Author: Sama Akram 22-555
    # ARGS the group_id i want to view
    def show
        @group_id = params[:id]
        @group = Group.find(params[:id])
        @postlist = Group.getposts (params[:id])
    end

    def new
        @group = Group.new
    end

   # Author: Sama Akram 22-555
    # As a system/admin/member I can create a group issue #157 
    # creates new group and if saved into db it creates a new record in GroupUser
    # with currend user_id & and current group_id then sets att. isCreator = true since he's the creator
    def create
        @group = Group.new(params[:group])
        @current_user = current_user
        if @group.save
            @groupuser = GroupUser.new(:group_id => @group.id, :user_id => @current_user.id )
            @groupuser.isCreator = 'true'
            @groupuser.save
            flash[:notice] = "تم انشاء المجتمع بنجاح"
            redirect_to :action => 'index'
        else
            render ('new')
        end
    end
end
