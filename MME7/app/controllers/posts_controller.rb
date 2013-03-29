class PostsController < ApplicationController
	# add a new post 
	def newPost
		@post = Post.new
	end

	#Author Riham Gamal 22-3871
	# create a new post
	def createPost
		@post = Post.new(params[:post])

		#Author Riham Gamal 22-3871
		# if the post is saved, 
		if @post.save
			flash[:notice] = "Post successfully created"
			redirect_to(:action => 'newPost')
		#Author Riham Gamal 22-3871
		# if the post is not saved, 
		else
			flash[:notice] = "Post could not be created"
			render('newPost')
		end

	end

end
