module GroupsHelper

    # As a system I can delete a group
    def destroy

        @group = Groups.find(params[:id])
        if isCreator(current_user.id) == 'true'
            @group.destroy
            #flash[:notice] = "group successfully deleted!"
            #redirect_to(:action => 'form')
        else
      	    #flash[:error] = "not allowed"
            #redirect_to(:action => 'form')
    end
end
