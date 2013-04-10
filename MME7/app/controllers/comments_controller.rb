class CommentsController < ApplicationController

  #Author Riham Gamal 22-3871
  # create a new comment
  # sama updated
  #Author: Sama Akram 22-555 
  #redirection changed to
  def createComment
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1 
    if @comment.save
      respond_to do |format|
      format.html {redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])}
      format.js
    end 
    else
      redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
    end
  end

  # Riham Gamal 22-3871
  #def editComment
   #@comment = Comment.find(params[:comment_id])
  #end

  # Riham Gamal 22-33871
  # update the comment by finding its id and chnaging the fields
  # sama updates
  # Author: Sama Akram 22-555 
  # redirection updates
  def updateComment
    @group_id = params[:group_id]
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.post_id = params[:post_id]
      flash[:notice] = "Comment successfully updated"
      redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
	
  # Salma El -Ruby 22-4649
  # deletes comments
  #def delete
   # @comment = Comment.find(params[:id])
  #end
  
  # Author: Sama Akram 22-555 
  # updated the redirection
  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
  end

  # Salma El -Ruby 22-4649
  # displays the available comments
  def list 
    @comments = Comment.all
  end
end
