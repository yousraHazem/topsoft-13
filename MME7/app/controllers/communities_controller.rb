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

end
