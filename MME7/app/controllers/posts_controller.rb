class PostsController < ApplicationController

	def newPost
		@post = Post.new
	end


	def createPost
		@post = Post.new(params[:post])

		if @post.save
			flash[:notice] = "Post successfully created"
			redirect_to(:action => 'newPost')
		else
			flash[:notice] = "Post could not be created"
			render('newPost')
		end

	end

end
