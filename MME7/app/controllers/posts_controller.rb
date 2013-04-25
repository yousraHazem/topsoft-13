#encoding: UTF-8
class PostsController < ApplicationController

	#Author Mariam Ismail 22-3456
	#creates a new post on a group
	def createPost
		@post = Post.new(params[:post])
		#@post.user_id =  @user_id
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

respond_to :html, :json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html {
          flash[:success] = "Profile updated"
          sign_in @user
          redirect_to @user
        }
        format.json { respond_with_bip(@user) }
      else
        format.html { render 'edit' }
        format.json { respond_with_bip(@user) }
      end
    end
  end

	#Author 22-3456
	#updates the group post
	respond_to :html, :json
	def updatePost
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
	    if (@post.is_group == true)
	    	redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
	    else
	    	redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
	    end
	end

	def getComments
	    @commentsList = Post.getPostComments(params[:id])
	end

end