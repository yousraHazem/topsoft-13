class CommentsController < ApplicationController

  
  #Author Riham Gamal 22-3871
  # create a new comment
  def createComment
    @project_id = params[:project_id]
    @comment = Comment.new(params[:comment]) 
    @comment.post_id = params[:id]
    @comment.save
    respond_to do |format|
    format.html { redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id]) }
    format.js
    end
  end

 
  # Riham Gamal 22-33871
  # update the comment by finding its id and chnaging the fields
  respond_to :html, :json
  def updateComment
    @project_id = params[:project_id]
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.post_id = params[:post_id]
    respond_with @comment  
  end


  # Salma El -Ruby 22-4649
  # deletes comments
  
  def destroy
    @project_id = params[:project_id]
    @post_id = params[:post_id]
    Comment.find(params[:id]).destroy
    redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
  end

  # Salma El -Ruby 22-4649
  # displays the available comments
  def list 
    @comment = Comment.all
  end


end
