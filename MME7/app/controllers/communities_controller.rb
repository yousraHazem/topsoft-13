class CommunitiesController < ApplicationController


	# Author : Mariam, 22-3456
	# This method lists all communities in the database
	#May update
	# Author : May Atef Badr 22-0579
	# this emthod lists the communities 
	#and if user uses the search, it will filter the list
	def list
		#@communities = Community.order("communities.title ASC")
		@communities=Community.search(params[:search])
	end

	#Author Mariam, 22-3456
	#Adds a new record of a community in the daabase

	def new
		@community= Community.new
	end


def createCommunity
	@community= Community.new(params[:community])
	
	if @community.save
	 redirect_to(:action => 'list')
    else 
	 render('new')
    end
end

	# Author Mariam, 22-3456
	# retrieves the community that the admin wishes to edit  by the id
	def edit
	    @community = Community.find(params[:id])
	end

def update
    @community = Community.find(params[:id])    
    if @community.update_attributes(params[:community])
	 redirect_to(:action => 'list')
    else 	
    render('edit')
    end
end

def show
	@community_id = params[:id]
	@communities = Community.find(params[:id])
end

#Author: May Badr 22-0579
	#find record to be deleted		
	def delete 
			@community = Community.find(params[:id])
			rescue ActiveRecord::RecordNotFound
	end

	#Author:May Atef Badr 22-0579
	#finds record, sets is_dismissed true and removes the delete-link from the view, the user
	# can only see the community info
	def destroy 

			@community = Community.find(params[:id])
			@community.is_dismissed = 'true'
			@community.save
			redirect_to(:action => 'list')

	end

end

