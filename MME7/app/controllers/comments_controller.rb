#encoding: UTF-8
class CommentsController < ApplicationController

  # Author: Sama Akram
  # creates a new comment and redirect to group/project path
  # ARGS: comment.comment, comment.group_id or comment.project_id, comment.is_group,
  # comment.user_id, comment.username
  # returns newly created comment
  def createComment
    @comment = Comment.new(params[:comment])
    @comment.save
    if (@comment.is_group == true)
      respond_to do |format|
        format.html {redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])}
        format.js
    end
    else
      respond_to do |format|
        format.html { redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id]) }
        format.js
      end
    end
  end

  # Author: Sama Akram
  # updates the comment
  # ARGS the updated attributes
  # returns the updated comment
  respond_to :html, :json
  def updateComment
    @group_id = params[:group_id]
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.post_id = params[:post_id]
    respond_with @comment
  end
 
  
  # Author Sama Akram
  # deletes a comment
  # ARGS comment_id
  # returns nothing, deletes this comment record from db
  def destroyComment
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
     if (@comment.is_group == true)
        redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
      else
        redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
      end
  end
end