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
		@post.user_id = 1
		@post.save
		respond_to do |format|
		format.html{redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
		format.js
		end
	end


	
	# Riham Gamal 22-3871
	# update the post by finding its id and changing the fields
	respond_to :html, :json
	def updatePostProject
		@project_id = params[:project_id]
		@post = Post.find(params[:id])
		@post.update_attributes(params[:post])			       		
		respond_with @post			
	end

	respond_to :html, :json
	def updatePostGroup
		 @group_id = params[:group_id]
		 @post = Post.find(params[:id])	     
	     @post.update_attributes(params[:post])
		 redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
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

		

