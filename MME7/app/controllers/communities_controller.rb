class CommunitiesController < ApplicationController

# Author : Mariam, 22-3456
# This method lists all communities in the database

def list
		@communities = Community.order("communities.title ASC")
end
	
 #Author Mariam, 22-3456
 #Adds a new record of a community in the daabase

def new
	@community= Community.new
end

# Author Mariam, 22-3456
# creates a new communtity by matching what the admin has entered with the fields in the model

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
  
# Author Mariam, 22-3456
# edits the already existing fields with wha the admin has entered

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
	#Author:May Badr 22-0579
	#deletes record chosen
	def destroy 
		Community.find(params[:id]).destroy
		rescue ActiveRecord::RecordNotFound
		redirect_to(:action => 'list')

	end
end

