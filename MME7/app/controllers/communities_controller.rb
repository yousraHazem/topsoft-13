class CommunitiesController < ApplicationController


	def list

		@communities = Community.order("communities.title ASC")
		
	end

	def show
		@communities= Community.find(params[:id])
		
	end
def new

	@community= Community.new
	
end

def create
	@community= Community.new(params[:community])
	   @community.save
	render ('create')



end


 def edit
    @community = Community.find(params[:id])
  end
  
  def update
    @community = Community.find(params[:id])
    
     @community.update_attributes(params[:community])
      
     
   render ('update')
  end

end
