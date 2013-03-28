class CommentsController < ApplicationController
	
	# initiate comment
	def newComment
		@comment = Comment.new
	end

	# create a new comment
	def createComment
		@comment = Comment.new(params[:comment])

		if @comment.save
			flash[:notice] = "Comment successfully created"
			redirect_to(:action => 'newComment')
		else
			flash[:notice] = "Comment could not be created"
			render('newComment')
		end

	end

end
