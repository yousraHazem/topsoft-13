class GroupsController < ApplicationController

  def index
    @group = Group.order("groups.position ASC")
  end

  # As a system I can delete a group
    def destroy
        @group = Groups.find(params[:id])
        #if isGroupCreator(current_user.id) == 'true'
        @group.destroy
        flash[:notice] = "group successfully deleted!"
        redirect_to(:action => 'index')
        #else
            #flash[:error] = "not allowed"
            #redirect_to(:action => 'new')
        #end
    end

    def delete
    @group = Group.find(params[:id])
    end

    def show
    @group = Group.find(params[:id])
    end

    # As a system I can create a group
    def new
    @group = Group.new
    end

    # As a system I can create a group
    def create
    @group = Group.new(params[:group])
    respond_to do |format|
      if @group.save
        #@group.isGroupCreator(current_user.id) == 'true'
        redirect_to ('index')
      else
        render ('new')
      end
    end
  end
end
