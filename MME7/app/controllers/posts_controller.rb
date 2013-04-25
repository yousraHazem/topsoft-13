#encoding: UTF-8
class PostsController < ApplicationController

	# Author Mariam Ismail
	# creates a new post and redirect to group/project path
	# ARGS: post.content, post.group_id or post.project_id, post.is_group,
	# post.user_id, post.username
	# returns newly created post
	def createPost
		@post = Post.new(params[:post])
		@post.save
		if (@post.is_group == true)
			respond_to do |format|
				format.html {redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
				format.js
		    end
	    else
	    	respond_to do |format|
	    		format.html { redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:id]) }
	    		format.js
		    end
	    end
	end

	# Author: Mariam Ismail
	# updates the post
	# ARGS the updated attributes
	# returns the updated post
	respond_to :html, :json
	def updatePost
		 @group_id = params[:group_id]
		 @post = Post.find(params[:id])	
		 @post.group_id = params[:group_id]     
	     @post.update_attributes(params[:post])
	     respond_with @post
	end

	# Author Mariam Ismail
	# deletes a post with its comments
	# ARGS post_id
	# returns nothing, deletes this post from the database 
	def destroyPost
		@group_id = params[:group_id]
        @post=Post.find(params[:post_id])
	    @post.destroy
	    if (@post.is_group == true)
	    	redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
	    else
	    	redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
	    end
	end
end