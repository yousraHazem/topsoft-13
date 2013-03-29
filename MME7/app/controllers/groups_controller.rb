class GroupsController < ApplicationController
	
	def list

		@group = Group.order("groups.group_name ASC")

	end

	def show
		@group= Group.find(params[:id])

	end
	
def edit
		@group = Group.find(params[:id])
	end

	# 
	# update the comment by finding its id and chnaging the fields
	def update
		@group = Group.find(params[:id])
		rescue ActiveRecord::RecordNotFound


		if @group.update_attributes(params[:group])
			flash[:notice] = "Group successfully updated"
			render("edit")
		else
			flash[:notice] = "Group could not be updated"
			render("edit")
		end
	end
	
############################################################################################################################
	#finds the group to be edited 
	#def edit 
	#	@group = Group.find(params[:id])
	#	rescue ActiveRecord::RecordNotFound
	#end
## RIGHT CODE
	# updates the chosen group with the new values
	#def update
		#@group = Group.find(params[:id])		
		#rescue ActiveRecord::RecordNotFound

		#if @group.update_attribute(params[:group]) 
		#	redirect_to(:action=>'list')
		#else 
		#render('edit')
		#end

##RIGHT CODE

#		#@group = Group.find(params[:id])
#		#rescue ActiveRecord::RecordNotFound

#		#if @group.update(group_name,params[:group])
 #   	#	redirect_to(:action=>'list')
  #		#else
  #		#	  render(:action=>'edit')
 	#	 #end

	

	#def edit
    #@group = Group.find(params[:id])
    #rescue ActiveRecord::RecordNotFound
 	 #end
  
 #def update
 #  		 # Find object using form parameters
  # 			# @group = Group.find(params[:id])
   #			# rescue ActiveRecord::RecordNotFound
#
  #		 if @groups
  		 	#for @group do
   # 					#if @group.update_attributes(params[:group])
   # 				@group = Group.find(params[:id])
   	#				rescue ActiveRecord::RecordNotFound
   	#				if @group.update(@group.id,params[:group])
   							#rescue ActiveRecord::RecordNotFound
    #				flash[:notice] = "Group successfully updated"
	#					redirect_to(:action => 'list')
	#				#render('edit')
 	 #				#redirect_to(:action => 'list', :id => @group.id)
	#					else
	#				#flash[:notice] = "Project could not be updated"
	#						render ('edit')
	#					end
	#		#end	end
					
	#	end end

	#def update_attributes(attributes)
    #    self.attributes = attributes
     #   save
     #end



    # Update the object
    #if @group.update_attributes(params[:group])
      # If update succeeds, redirect to the list action
    #  redirect_to(:action => 'list', :id => @group.id)
   # else
      # If save fails, redisplay the form so user can fix problems
     # render('edit')
    #end
  #def update
	#	Group.find_by_id(params[:id]).update_attributes(params[:group])
	#	redirect_to(:action=>'list')
	#end

	
#end
end

