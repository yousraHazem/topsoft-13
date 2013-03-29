class GroupsController < ApplicationController
	
	def list

		@group = Group.order("groups.group_name ASC")

	end

	def show
		@group= Group.find(params[:id])

	end
	def new

		@group= Group.new

	end

	def create
		@group= Group.new(params[:group])
	 	  @group.save
		render ('create')
	end 

	#finds the group to be edited 
	#def edit 
	#	@group = Group.find(params[:id])
	#	rescue ActiveRecord::RecordNotFound
	#end

	# updates the chosen group with the new values
	#def update
	#	@group = Group.find(params[:id])		
	#	rescue ActiveRecord::RecordNotFound

	#	if @group.update_attributes(params[:group]) 
	#		redirect_to(:action=>'list')
	#	else 
	#	render('edit')
	#	end

#		#@group = Group.find(params[:id])
#		#rescue ActiveRecord::RecordNotFound

#		#if @group.update(group_name,params[:group])
 #   	#	redirect_to(:action=>'list')
  #		#else
  #		#	  render(:action=>'edit')
 	#	 #end

	#end

	def edit
    @group = Group.find(params[:id])
    rescue ActiveRecord::RecordNotFound
 	 end
  
  def update
    # Find object using form parameters
    @group = Group.find(params[:id])
    rescue ActiveRecord::RecordNotFound

    if @group.update_attributes(params[:group])
   
    		flash[:notice] = "Group successfully updated"
			
			render('edit')
 	 		#redirect_to(:action => 'list', :id => @group.id)
	else
		flash[:notice] = "Project could not be updated"
	end

	



    # Update the object
    #if @group.update_attributes(params[:group])
      # If update succeeds, redirect to the list action
    #  redirect_to(:action => 'list', :id => @group.id)
   # else
      # If save fails, redisplay the form so user can fix problems
     # render('edit')
    #end
  end

	
#end
end

