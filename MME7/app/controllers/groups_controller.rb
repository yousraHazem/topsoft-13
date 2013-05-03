#encoding: UTF-8
class GroupsController < ApplicationController
include GroupUsersHelper

    # Author: Sama Akram 22-555, it gets all groups ordered alphabetically by group name
    # returns Group.all ordered by name
    # update May
    # Author: May Atef Badr 22-0579
    # this method lists the groups 
    # and if user uses the search, it will filter the list
    # Args: group name
    # Returns: searched groups or simular group name/s
    def index
        @groups=Group.new.search(params[:search])
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
        @position = 0
    end
    
    # Author: Sama Akram
    # groups hierarchy
    # ARGS: parent_id
    def new
        @group = Group.new(:parent_id => params[:parent_id])
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
            redirect_to :action => 'show', :id => @group.id
        else
            render ('new')
        end
    end

    # Author: May Badr 22-0579
    # finds the resord to be edited
    # Args: group id
    # Returns: nothing
    def edit
        @group = Group.find(params[:id])
    end

    # Author: May Badr 22-0579
    # updates the chosen record and returns to the list if succeeded and flashes a msg
    # and if not will flash a msg of failure and returns to edit page
    # Args: group id
    # Returns: updated group
    def update
        @group = Group.find(params[:id])
        if @group.update_attributes(params[:group])
            flash[:notice]= "تم التعديل بنجاح "
            redirect_to :action => 'show', :id => @group.id
        else
            render ('edit')
        end
    end
end