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

def create
	@community= Community.new(params[:community])
	   if @community.save
	render ('create')
else 
	render ('new')

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
      
   render ('update')
else 

render ('edit')
end

  end

end
