class PostsController < ApplicationController


	def createPostGroup
		@post = Post.new(params[:post])
		@post.user_id = current_user
		@post.save
		respond_to do |format|
		format.html {redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
		format.js
		end
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


	
	end

		
