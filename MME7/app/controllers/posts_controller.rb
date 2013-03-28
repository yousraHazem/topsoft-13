class PostsController < ApplicationController
	
	# fimd the post you want to edit
	def editPost
		@post = Post.find(params[:id])
	end

	# update the post by finding its id and chnaging the fields
	def updatePost
		@post = Post.find(params[:id])
		rescue_from ActiveRecord::RecordNotFound do
  		flash[:notice] = 'The object you tried to access does not exist'
  		render :not_found   # or e.g. redirect_to :action => :index
		end

		if @post.update_attributes(param[:post])
			flash[:notice] = "Post successfully updated"
			render("updatePost")
		else
			flash[:notice] = "Post could not be updated"
			render("editPost")
		end
	end
end
