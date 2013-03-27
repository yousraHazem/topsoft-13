class PostsController < ApplicationController

	def newPost
		@post = Post.new
	end

	def createPost
		@post = Post.new(params[:post])
		if @post.save
			flash[:notice] = "Post successfully created"
			#redirect_to("")
		else
			flash[:notice] = "Post could not be created"
			render('newPost')
		end
	end

	def editPost
		@post = Post.find(param[:id])
	end
	
	def updatePost
		@post = Post.find(param[:id])
		if @post.update_attributes(param[:post])
			flash[:notice] = "Post successfully updated"
			render("updatePost")
		else
			flash[:notice] = "Post could not be updated"
			render("editPost")
		end
	end


end
