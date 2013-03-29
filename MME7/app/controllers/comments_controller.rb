class CommentsController < ApplicationController
	
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