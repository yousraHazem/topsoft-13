class CommunitiesController < ApplicationController


	def list

		@communities = Community.order("communities.title ASC")
		
	end

	def show
		@communities= Community.find(params[:id])
		
	end

	 #creates a new communtity by matching what the admin has entered with the fields in the model
def new

	@community= Community.new
	
end

def create
	@community= Community.new(params[:community])
	   if @community.save
	render ('create')
else 
	render ('new')

end

end
#edits the community by updating the already existing fields with what the admin has entered


 def edit
    @community = Community.find(params[:id])
  end
  
  def update
    @community = Community.find(params[:id])
    
     if @community.update_attributes(params[:community])
      
   render ('update')
else 

render ('edit')
end

  end

end
