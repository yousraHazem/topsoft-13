class CommunitiesController < ApplicationController

	def delete 
		@community = Community.find(params[:id])
	end

	def destroy 
		Community.find(params[:id].destroy
		redirect_to (:action =>'application')
	end
	
end
