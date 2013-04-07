class CommentsController < ApplicationController

  #Author Riham Gamal 22-3871
  # create a new comment
  # sama updated
  #Author: Sama Akram 22-555 made the dependency with post so that i can only comment on a specific post
  def createComment
    @comment = Comment.new(params[:comment])
    #Author Riham Gamal 22-3871
    # if the comment is saved, 
    if @comment.save
      flash[:notice] = "Comment successfully created"
      respond_to do |format|
        format.html{redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
      end
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
    @comment = Comment.find(params[:id])
  end

  # Riham Gamal 22-33871
  # update the comment by finding its id and chnaging the fields
  # sama updates
  # Author: Sama Akram 22-555 same concept as new we find the post id first that has the comment
  # the user wants to edit
  def updateComment
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment successfully updated"
      redirect_to :action => 'list'
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
  def delete
    @comment = Comment.find(params[:id])
  end
  
  # Author: Sama Akram 22-555 we find the post id first that has the comment
  # the user wants to edit
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(:action => 'list')
  end

  # Salma El -Ruby 22-4649
  # displays the available comments
  def list 
    @comments = Comment.all
  end
end
