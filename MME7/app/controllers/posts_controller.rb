class PostsController < ApplicationController
 	# Riham Gamal 22-3871
 	# add a new post 
	def newPost
		@project_id = params[:id]
		@post = Post.new
	end

	#Author Riham Gamal 22-3871
	# create a new post
	def createPost
		@project_id = params[:id]
		@post = Post.new(params[:post])
		@post.project_id = params[:id]
		if @post.save
		respond_to do |format|
        format.html { redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:id]) }
        format.js
	    end
		else
			redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:id])
		end	
    	end
		# redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:id])


	
	# Riham Gamal 22-3871
	# update the post by finding its id and changing the fields
	respond_to :html, :json
	def updatePost
		@project_id = params[:project_id]
		@post = Post.find(params[:id])
		@post.update_attributes(params[:post])			       		
		respond_with @post			
	end

	
	# Salma El Ruby 22-4649
	# deletes posts
	  def delete
	    @post = Post.find(params[:id])
	  end
	  
	  def destroy
	  	@project_id = params[:project_id]
	    Post.find(params[:id]).destroy
	    #redirect_to(:action => 'list')
	    redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
	  end

		# Salma El Ruby 22-4649
		# displays all available posts 
	    def list 
		@post = Post.all
	    end


	    def getComments
	    	 @commentsList = Post.getPostComments(params[:id])
	    end

	end

		

