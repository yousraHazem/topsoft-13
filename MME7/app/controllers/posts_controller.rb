<<<<<<< HEAD
﻿class PostsController < ApplicationController


 #  def delete
 #    @post = Post.find(params[:id])
 #  end
  
 #  def destroy
 #    Post.find(params[:id]).destroy
 #    redirect_to(:action => 'list')
 #  end

 #    def list 
	# @post = Post.all
 #    end

 	# Riham Gamal 22-3871
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

	# # add a new post 
	# def newPost
	# 	@post = Post.new
	# end

	# Salma El Ruby 22-4649
	# deletes posts
	  def delete
	    @post = Post.find(params[:id])
	  end
	  
	  def destroy
	    Post.find(params[:id]).destroy
	    redirect_to(:action => 'list')
	  end

		# Salma El Ruby 22-4649
		# displays all available posts 
	    def list 
		@post = Post.all
	    end

		



end
=======
class PostsController < ApplicationController

	#Author Riham Gamal 22-3871
	# create a new post
	def createPostProject
		@project_id = params[:id]
		@post = Post.new(params[:post])
		@post.save
		respond_to do |format|
    	format.html { redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:id]) }
    	format.js
		end
	end

	def createPostGroup
		@post = Post.new(params[:post])
		@post.user_id = current_user
		@post.save
		respond_to do |format|
		format.html {redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
		format.js
		end
	end

	
	#Riham Gamal 22-3871
	#update the post by finding its id and changing the fields
	respond_to :html, :json
	def updatePostProject
		@project_id = params[:project_id]
		@post = Post.find(params[:id])
		@post.user_id = params[:user_id]
		@post.update_attributes(params[:post])			       		
		respond_with @post			
	end

	respond_to :html, :json
	def updatePostGroup
		 @group_id = params[:group_id]
		 @post = Post.find(params[:id])	
		 @post.group_id = params[:group_id]     
	     @post.update_attributes(params[:post])
	     respond_with @post
	end

	  
	def destroyPostGroup
	  	@project_id = params[:project_id]
	    Post.find(params[:id]).destroy
	    redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
	end

		
	# Riham Gamal 22-3871, Mariam Ismail 22-3456
	# update the post by finding its id and changing the fields
	# takes the group-id and redirects back to show group

	
	def destroyPost
		@group_id = params[:group_id]
        @post=Post.find(params[:post_id])
	    @post.destroy
	    redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
	end
		
	   
	   
	    def getComments
	    	 @commentsList = Post.getPostComments(params[:id])
	    end

	end

		


>>>>>>> master
