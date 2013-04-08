class CommentsController < ApplicationController

  #Author Riham Gamal 22-3871
  # create a new comment
  # sama updated
  #Author: Sama Akram 22-555 
  #redirection changed to
  def createComment
    @comment = Comment.new(params[:comment])
    #Author Riham Gamal 22-3871
    # if the comment is saved, 
    if @comment.save
      flash[:notice] = "Comment successfully created"
      redirect_to(:controller => 'groups',:action => 'show', :id => params[:id])
      #redirect_to(:controller => 'groups',:action => 'show', :id => @group_id)
      #Author Riham Gamal 22-3871
      # if the comment is not saved, 
    else
      flash[:notice] = "Comment could not be created"
      render('newComment')
    end
  end

  # Riham Gamal 22-3871
  def editComment
    @comment = Comment.find(params[:comment_id])
  end

  # Riham Gamal 22-33871
  # update the comment by finding its id and chnaging the fields
  # sama updates
  # Author: Sama Akram 22-555 
  # redirection updates
  def updateComment
    @comment = Comment.find(params[:comment_id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment successfully updated"
      redirect_to(:controller => 'groups',:action => 'show', :id => params[:id])
    else
      flash[:notice] = "Comment could not be updated"
      render("editComment")
    end
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
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(:controller => 'groups', :action => 'show', :id => @group.id)
  end

  # Salma El -Ruby 22-4649
  # displays the available comments
  def list 
    @comments = Comment.all
  end
end
