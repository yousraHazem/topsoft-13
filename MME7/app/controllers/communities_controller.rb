#encoding: UTF-8
class CommunitiesController < ApplicationController

# Author : Mariam, 22-3456
# This method lists all communities in the database
# It returns all communities

def list
		@communities = Community.order("communities.title ASC")
end

def new
	@community= Community.new
end

# Author Mariam, 22-3456
# creates a new communtity by matching what the admin has entered with the fields in the model
# takes the community title, social profile info and contact info 
# returns nothing, it only adds a new record of a community in the database 
def createCommunity
	@community= Community.new(params[:community])
	if @community.save
		flash[:notice]= "تم انشاء المجتمع بنجاح "
	 redirect_to(:action => 'list')
    else 
	 render('new')
    end
end

def edit
    @community = Community.find(params[:id])
end
  
# Author Mariam, 22-3456
# edits the already existing fields with wha the admin has entered
# it takes the community id
# returns nothing only amends what the user has edited in that record in the database
def update
    @community = Community.find(params[:id])    
    if @community.update_attributes(params[:community])
    	flash[:notice]= "Community successfully edited"
	 redirect_to(:action => 'list')
    else 	
    render('edit')
    end
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



