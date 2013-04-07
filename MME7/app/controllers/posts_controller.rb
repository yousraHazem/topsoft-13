class PostsController < ApplicationController
include PostsHelper
 
 	def index
        @posts = Post.order("posts.content ASC")
    end


   # Riham Gamal 22-3871
 	# add a new post 

	def newPost
		@group_id = params[:id]
		@post = Post.new
	end

	#Author Riham Gamal 22-3871, Mariam Ismail 22-3456
	# create a new post
	# if the post is saved, added to this method the group-id 
	def createPost

		@post = Post.new(params[:post])

		if @post.save
			flash[:notice] = "Post successfully created"
			#redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])
			respond_to do |format|
				format.html{redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
				format.js
			end
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
	    @group_id = params[:group_id]
	    @post_id=params[:id]
		@post = Post.find(params[:id])
		
end

	# Riham Gamal 22-3871
	# update the post by finding its id and changing the fields


	def updatePost
		 @post = Post.find(params[:post_id])
		 @group_id = params[:group_id]
	    @post_id=params[:post_id]
        
		if @post.update_attributes(params[:post])

			flash[:notice] = "Post successfully updated"
			redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
		else

			flash[:notice] = "Post could not be updated"
			 
			redirect_to(:action => 'editPost',:id =>@post_id, :group_id =>@group_id)
		end


	end

	# # add a new post 
	# def newPost
	# 	@post = Post.new
	# end

	# Salma El Ruby 22-4649, Mariam Ismail 22-3456
	# deletes posts
	# deletes a post  from a group
	  def delete
	  	@group_id = params[:group_id]
	    @post_id=params[:id]
	    @post = Post.find(params[:id])
	  end
	  
	  def destroy

		 @group_id = params[:group_id]
	    Post.find(params[:id]).destroy
	    flash[:notice] = "Post successfully deleted"
	    redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
	  end


# Salma El Ruby 22-4649
# displays all available posts 
    def list 
	@post = Post.all
	# Post.getposts (32)
       
    end
end
