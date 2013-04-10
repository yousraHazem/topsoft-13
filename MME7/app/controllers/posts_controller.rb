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
		@post.user_id = 1
		if @post.save
			respond_to do |format|
				format.html{redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
				format.js
		end
		else
			redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])
		end

	end


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
		@group_id = params[:group_id]
	    @post = Post.find(params[:post_id])
	    @post.destroy
	    redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
	  end
		# Salma El Ruby 22-4649
		# displays all available posts 
	    def list 
		@post = Post.all
	    end	

end
