class CommunitiesController < ApplicationController
	
	def list

		@communities = Community.order("communities.title ASC")

	end

	
	#Author:May Atef Badr 22-0579
	#finds record, sets is_dismissed true and removes the delete-link from the view, the user
	# can only see the community info

	def destroy 

		@community = Community.find(params[:id])
		@community.is_dismissed = 'true'
		@community.save
		redirect_to(:action => 'list')

	end
end