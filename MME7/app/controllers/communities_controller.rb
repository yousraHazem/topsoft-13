class CommunitiesController < ApplicationController


	def list

		@communities = Community.order("communities.title ASC")
		
	end

	def show
		@communities= Community.find(params[:id])
		
	end
def new
	#creates a new community by taking inputs from admin and adding it into the model

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

end
