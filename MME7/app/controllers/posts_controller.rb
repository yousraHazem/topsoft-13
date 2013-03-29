class PostsController < ApplicationController
	
	# fimd the post you want to edit
	def editPost
		@post = Post.find(params[:id])
	end

	# update the post by finding its id and chnaging the fields
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
