class PostsController < ApplicationController
include PostsHelper
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
		@group_id = params[:id]
		@post = Post.new
	end

	#Author Riham Gamal 22-3871
	# create a new post
	def createPost

		@post = Post.new(params[:post])

		#Author Riham Gamal 22-3871, Mariam Ismail 22-3456
		# if the post is saved, added to this method the group-id 
		if @post.save
			flash[:notice] = "Post successfully created"
			redirect_to(:action => 'list')
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
	#else
		#render('problempost')
	#end
end


	# Riham Gamal 22-3871
	# update the post by finding its id and changing the fields



	def updatePost
		 @post = Post.find(params[:id])

        
		if @post.update_attributes(params[:post])
			flash[:notice] = "Post successfully updated"
			redirect_to(:action => 'list')
		else
			flash[:notice] = "Post could not be updated"
			 render("editPost")
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
	    flash[:notice] = "Post successfully deleted"
	    redirect_to(:action => 'list')
	  end


# Salma El Ruby 22-4649
# displays all available posts 
    def list 
	@post = Post.all
    end

		# Salma El Ruby 22-4649
		# displays all available posts 
	    def list 
		@post = Post.all
	    end

end
