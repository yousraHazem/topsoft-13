class GroupsController < ApplicationController

    def index
        #@groups = Group.order("groups.group_name ASC")
        @groups=Group.search(params[:search])
   
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
    
    

    #def indexSearch
     #   @groups = Groups.search(params[:search])
    #end

    #def self.search(search)
     #   if search
      #       find(:all, :conditions => ['group_name LIKE ?', "%#{search}%"])
       # else
        #     find(:all)
        #end
    #end

    #def search
     #   if params[:search]
      #      @groups = Group.find(:all,:condition =>['group_name LIKE?', "%#{params[:search]}%"])
       # else
        #    @groups= Group.find(:all)
        #end
    #end
    ##HTML
    #<% form_tag group_path, :method => 'get' do %>
     #<p>
      #   <%= text_field_tag :search, params[:search] %>
       #  <%= submit_tag "Search", :name => nil %>
     #</p>
    #<% end %>
end
