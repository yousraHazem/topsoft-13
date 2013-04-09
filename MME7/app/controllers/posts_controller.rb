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
			redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])
		end

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
