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
	def edit 
		@group = Group.find(params[:id])
		rescue ActiveRecord::RecordNotFound
	end

	# updates the chosen group with the new values
	def update
		@group = Group.find(params[:id])		
		rescue ActiveRecord::RecordNotFound

		if @group.update_attributes(params[:group]) 
			redirect_to(:action=>'list')
		else 
		render('edit')
		end

		#@group = Group.find(params[:id])
		#rescue ActiveRecord::RecordNotFound

		#if @group.update(group_name,params[:group])
    	#	redirect_to(:action=>'list')
  		#else
  		#	  render(:action=>'edit')
 		 #end

	end

	#rescue_from ActiveRecord::RecordNotFound do
  #flash[:notice] = 'The object you tried to access does not exist'
 # render :not_found   # or e.g. redirect_to :action => :index
#end
end
