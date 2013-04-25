#encoding: UTF-8
class CommentsController < ApplicationController

  # sama updated
  #Author: Sama Akram 22-555 
  #redirection changed to
  def createComment
     #@comment_user = current_user
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


  respond_to :html, :json
  def updateComment
    @group_id = params[:group_id]
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.post_id = params[:post_id]
    respond_with @comment
end
 
  def destroyComment
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
     if (@comment.is_group == true)
        redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
      else
        redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
      end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  # Salma El -Ruby 22-4649
  # displays the available comments
  def list 
    @comment = Comment.all
  end

end