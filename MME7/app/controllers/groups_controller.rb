class GroupsController < ApplicationController


    #def index
       # @groups = Group.order("groups.id")

    # May Atef Badr 22-0579
    # this method lists the groups 
    #and if user uses the search, it will filter the list
    def index
        #@groups = Group.order("groups.group_name ASC")
        @groups=Group.search(params[:search])
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
    def new
        @group = Group.new
    end

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
        #else
         #   flash[:notice] = "Group could not be updated"
          #  redirect_to(:action => 'edit')
        end
    end
end
