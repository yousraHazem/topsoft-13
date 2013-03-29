class CommunitiesController < ApplicationController
	
	def list

		@communities = Community.order("communities.title ASC")

	end


	def delete 
		@community = Community.find(params[:id])
	end

	def destroy 
		Community.find(params[:id].destroy
		redirect_to(:action => 'list')
	end
end

