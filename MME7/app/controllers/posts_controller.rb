class PostsController < ApplicationController
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


	# Riham Gamal 22-3871, Mariam Ismail 22-3456
	# find the post you want to edit
	# takes the group id


	
	# Riham Gamal 22-3871, Mariam Ismail 22-3456
	# update the post by finding its id and changing the fields
	# takes the group-id and redirects back to show group


	respond_to :html, :json
	def updatePost
		 @post = Post.find(params[:post_id])
		 @group_id = params[:group_id]
	     @post_id=params[:post_id]
	     @post.update_attributes(params[:post])
		 respond_with @post
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
