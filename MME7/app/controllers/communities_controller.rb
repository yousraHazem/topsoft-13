class CommunitiesController < ApplicationController
	
	def list

		@communities = Community.order("communities.title ASC")

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