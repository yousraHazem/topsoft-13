class CommentsController < ApplicationController

	def newComment
		@comment = Comment.new
	end
	
	def createComment
		@comment = Comment.new(params[:comment])
		if @comment.save
			flash[:notice] = "Comment successfully created"
			#redirect_to("")
		else
			flash[:notice] = "Comment could not be created"
			render('newComment')
		end
	end

	def editComment
		@comment = Comment.find(param[:id])
	end

	def updateComment
		@comment = Comment.find(param[:id])
		if @comment.update_attributes(param[:comment])
			flash[:notice] = "Comment successfully updated"
			render("updateComment")
		else
			flash[:notice] = "Comment could not be updated"
			render("editComment")
		end
	end


end
