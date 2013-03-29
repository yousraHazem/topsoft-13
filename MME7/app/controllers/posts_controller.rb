class PostsController < ApplicationController
	
	# Riham Gamal 22-3871
	# find the post you want to edit
	def editPost
		@post = Post.find(params[:id])
	end

	# Riham Gamal 22-3871
	# update the post by finding its id and changing the fields
	def updatePost
		@post = Post.find(params[:id])
		
		if @post.update_attributes(params[:post])
			flash[:notice] = "Post successfully updated"
			render("editPost")
		else
			flash[:notice] = "Post could not be updated"
			# render("editPost")
		end
	end
end
