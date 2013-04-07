class CommentsController < ApplicationController

  #Author Riham Gamal 22-3871
  # add a new comment
  def newComment
    @comment = Comment.new
  end

  #Author Riham Gamal 22-3871
  # create a new comment
  def createComment
    @project_id = params[:project_id]
    @comment = Comment.new(params[:comment]) 
    @comment.post_id = params[:id]
    #Author Riham Gamal 22-3871
    # if the comment is saved, 
    if @comment.save
      flash[:notice] = "Comment successfully created"
    #Author Riham Gamal 22-3871
    # if the comment is not saved, 
    else
      flash[:notice] = "Comment could not be created"
    end
    redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
  end

  # Riham Gamal 22-3871
  def editComment
    @comment = Comment.find(params[:id])
  end

  # Riham Gamal 22-33871
  # update the comment by finding its id and chnaging the fields
  def updateComment
    @comment = Comment.find(params[:id])
    

    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment successfully updated"
      render("editComment")
    else
      flash[:notice] = "Comment could not be updated"
      render("editComment")
    end

  end


  # def delete
  #   @comment = Comment.find(params[:id])
  # end
  
  # def destroy
  #   Comment.find(params[:id]).destroy
  #   redirect_to(:action => 'list')
  # end

  # def list 
  #   @comment = Comment.all
  #  end
	
  # Salma El -Ruby 22-4649
  # deletes comments
  def delete
    @comment = Comment.find(params[:id])
  end
  

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

  # Salma El -Ruby 22-4649
  # displays the available comments
  def list 
    @comment = Comment.all
  end


end
