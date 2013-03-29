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
