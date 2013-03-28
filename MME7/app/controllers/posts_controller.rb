class PostsController < ApplicationController
	def editPost
		@post = Post.find(params[:id])
	end

	def updatePost
		@post = Post.find(params[:id])
		if @post.update_attributes(param[:post])
			flash[:notice] = "Post successfully updated"
			render("updatePost")
		else
			flash[:notice] = "Post could not be updated"
			render("editPost")
		end
	end
end
