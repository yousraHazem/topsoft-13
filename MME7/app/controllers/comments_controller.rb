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


	
	#Author Riham Gamal 22-3871
	# add a new comment
	def newComment
		@comment = Comment.new
	end

	#Author Riham Gamal 22-3871
	# create a new comment
	def createComment
		@comment = Comment.new(params[:comment])

		#Author Riham Gamal 22-3871
		# if the comment is saved, 
		if @comment.save
			flash[:notice] = "Comment successfully created"
			redirect_to(:action => 'newComment')
		#Author Riham Gamal 22-3871
		# if the comment is not saved, 
		else
			flash[:notice] = "Comment could not be created"
			render('newComment')
		end

	end

end
>>>>>>> master
