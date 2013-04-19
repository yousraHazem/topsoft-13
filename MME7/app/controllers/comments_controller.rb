#encoding: UTF-8
class CommentsController < ApplicationController

  # sama updated
  #Author: Sama Akram 22-555 
  #redirection changed to
  def createCommentGroup
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1 #@user_id
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
  

end
