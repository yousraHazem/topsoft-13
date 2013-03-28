class CommentsController < ApplicationController
	# fimd the comment you want to edit
	def editComment
		@comment = Comment.find(params[:id])
	end

	# update the comment by finding its id and chnaging the fields
	def updateComment
		@comment = Comment.find(params[:id])
		rescue_from ActiveRecord::RecordNotFound do
  		flash[:notice] = 'The object you tried to access does not exist'
  		render :not_found   # or e.g. redirect_to :action => :index
		end

		if @comment.update_attributes(param[:comment])
			flash[:notice] = "Comment successfully updated"
			render("updateComment")
		else
			flash[:notice] = "Comment could not be updated"
			render("editComment")
		end
	end
end


