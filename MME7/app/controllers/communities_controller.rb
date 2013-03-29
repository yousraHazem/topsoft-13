class CommunitiesController < ApplicationController

	def list

		@communities = Community.order("communities.title ASC")

	end


	def delete 
		@community = Community.find(params[:id])
		rescue ActiveRecord::RecordNotFound
	end

	def destroy 
		Community.find(params[:id]).destroy
		rescue ActiveRecord::RecordNotFound
		redirect_to(:action => 'list')

	end
end