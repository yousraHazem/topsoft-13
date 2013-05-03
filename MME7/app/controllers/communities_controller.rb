#encoding: UTF-8
class CommunitiesController < ApplicationController
# Author : Mariam, 22-3456
# This method lists all communities in the database
# It returns all communities
#May update
# Author : May Atef Badr 22-0579
# this method lists the communities 
# and if user uses the search, it will filter the list
# Args: community title
# Returns: similar or wanted community

def list
	@communities= Community.new.search(params[:search])
end


# Author: May Atef Badr 22-0579
# this moethod shows a community with it's info and edit and delete button
# Args: community id
# Returns: community title, social profile info and contact info

def show
    @community = Community.find(params[:id])
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
    	flash[:notice]= "تم التعديل بنجاح "
	    redirect_to(:action => 'list')
    else 	
        render('edit')
    end
end


# Author: May Badr 22-0579
# find record to be deleted	
# Args : community  id
# Retuns : returns nothing	
def delete 
	@community = Community.find(params[:id])
end

# Author: May Atef Badr 22-0579
# finds record, sets is_dismissed true and removes the delete-link from the view, the user
# can only see the community info
# Args: community  id
# retuns: returns the community without the edit and delete links
def destroy 
	@community = Community.find(params[:id])
	@community.is_dismissed = 'true'
	@community.save
	redirect_to :action => 'show', :id => @community.id
end

end
