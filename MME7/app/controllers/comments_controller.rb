class CommentsController < ApplicationController

  
  # Author : Salma El -Ruby 22-4649
  # Args : takes comment_id 
  # Returns : redirects to page with comments available 
  # Explanation : this method deletes un wanted comment
  def delete
    @comment = Comment.find(params[:id])
  end
  

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

 
  # Author : Salma El -Ruby 22-4649
  # Args : --
  # Returns : shows page with all comments available 
  # Explanation : this method shows all comments
  def list 
    @comment = Comment.all
  end


end
