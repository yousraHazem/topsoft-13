class PostsController < ApplicationController

	#Author Riham Gamal 22-3871, Mariam Ismail 22-3456
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

	#Author Mariam Ismail 22-3456
	# creates a new post on a group
	def createPostGroup
		@post = Post.new(params[:post])
		@post.user_id = @user_id
		@post.save
		respond_to do |format|
		format.html {redirect_to(:controller => 'projects',:action => 'show', :id =>params[:id])}
		format.js
		end
	end
	
	#Riham Gamal 22-3871
	#update the post by finding its id and changing the fields
	    respond_to :html, :json
	def updatePostProject
		@project_id = params[:project_id]
		@post = Post.find(params[:id])
		@post.update_attributes(params[:post])			       		
		respond_with @post			
	end

	#Author 22-3456
	#updates the group post
	respond_to :html, :json
	def updatePostGroup
		 @group_id = params[:group_id]
		 @post = Post.find(params[:id])	
		 @post.group_id = params[:group_id]     
	     @post.update_attributes(params[:post])
	     respond_with @post
	end

	#Author Mariam Ismail 22-3456
	# delete a post from a group with its comments
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