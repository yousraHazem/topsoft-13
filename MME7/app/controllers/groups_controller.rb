class GroupsController < ApplicationController
	def edit 
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		if @group.update_attributes(params[:group_name])
			redirect_to (:action =>'show', :id => @group.id)
		else if  @group.update_attributes(params[:description])
			redirect_to (:action =>'show', :id => @group.id)
		else if @group.update_attributes(params[:levels])
			redirect_to (:action =>'show', :id => @group.id)
		else 
			render('edit')
		end 

	end
end
