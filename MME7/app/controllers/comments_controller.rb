class CommentsController < ApplicationController
	# Riham Gamal 22-33871
	# fimd the comment you want to edit
	def editComment
		@comment = Comment.find(params[:id])
	end

	# Riham Gamal 22-33871
	# update the comment by finding its id and chnaging the fields
	def updateComment
		@comment = Comment.find(params[:id])
		

		if @comment.update_attributes(params[:comment])
			flash[:notice] = "Comment successfully updated"
			render("editComment")
		else
			flash[:notice] = "Comment could not be updated"
			render("editComment")
		end
	end
end


