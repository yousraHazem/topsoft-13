#encoding: UTF-8
class PostsController < ApplicationController

	def showProject
		@post = Post.find(params[:id])
		@project = Project.find(@post.project_id)
		@position = 1
	end

	def showGroup
		@post = Post.find(params[:id])
		@group = Group.find(@post.group_id)
		@position = 1
	end

	# Author Mariam Ismail
	# creates a new post and redirect to group/project path
	# ARGS: post.content, post.group_id or post.project_id, post.is_group,
	# post.user_id, post.username
	# returns newly created post
	def createPost
		@post = Post.new(params[:post])
		@post.save
		if (@post.is_group == true)
            group_name = Group.find(@post.group_id).group_name
	        @members = GroupUser.where(:group_id => @post.group_id)
	        notification = Notification.create(:content=>"#{current_user.name}  قام بنشر تعبير جديد بمجموعة '#{group_name}'" , :url =>"/groups/show/#{@post.group_id}" , :image=>"post") 
	        current_id = current_user.id
	        @members.each do |member|
	          if 	
	           member.user_id == current_id
	          else
	           NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
	          end
	        end
			respond_to do |format|
				format.html {redirect_to(:controller => 'groups',:action => 'show', :id =>@post.group_id)}
				format.js
		    end
		end
	    if (@post.is_group == false)   
	        project_name = Project.find(@post.project_id).name
	        @members = ProjectUser.where(:project_id => @post.project_id)
	        notification = Notification.create(:content=>"#{current_user.name}  قام بنشر تعبير جديد بمشروع '#{project_name}'" , :url =>"/projects/show/#{@post.project_id}" , :image=>"post") 
	        current_id = current_user.id
	        @members.each do |member|
	          if 	
	           member.user_id == current_id
	          else
	           NotificationUser.create(:user_id=>member.user_id , :notification_id=> notification.id)
	          end
	        end
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



	def post_url something
		"test"
	end

	# Author Mariam Ismail
	# deletes a post with its comments
	# ARGS post_id
	# returns nothing, deletes this post from the database 
	def destroyPost
		@group_id = params[:group_id]
        @post=Post.find(params[:post_id])
        @post.comments.destroy_all
	    @post.destroy
	    if (@post.is_group == true)
	    	redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
	    else
	    	redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
	    end
	end
end
