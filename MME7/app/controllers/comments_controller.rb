
class CommentsController < ApplicationController

  #Author Riham Gamal 22-3871
  # create a new comment  
  def createCommentProject
    @project_id = params[:project_id]
    @comment = Comment.new(params[:comment]) 
    @comment.post_id = params[:id]
    @comment.save
    respond_to do |format|
    format.html { redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id]) }
    format.js
    end
  end
  # sama updated
  #Author: Sama Akram 22-555 
  #redirection changed to
  def createCommentGroup
    @comment = Comment.new(params[:comment])
    @comment.user_id = @user_id
    @comment.save
    respond_to do |format|
    format.html {redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])}
    format.js
    end 
  end

  respond_to :html, :json
  def updateCommentProject
    @project_id = params[:project_id]
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.post_id = params[:post_id]
    respond_with @comment  
  end

  respond_to :html, :json
  def updateCommentGroup
    @group_id = params[:group_id]
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.post_id = params[:post_id]
    flash[:notice] = "Comment successfully updated"
    respond_with @comment 
  end
 
  def destroyCommentProject
    @project_id = params[:project_id]
    @post_id = params[:post_id]
    Comment.find(params[:id]).destroy
    redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
  end
  
  # Author: Sama Akram 22-555 
  # updated the redirection
  def destroyCommentGroup
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
  end

  def show
    @comment = Comment.find(params[:id])
  end
  
  # Salma El -Ruby 22-4649
  # displays the available comments
  def list 
    @post = Post.find(params[:id])
  end

end
