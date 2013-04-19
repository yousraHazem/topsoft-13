class CommentsController < ApplicationController

  # Author : Salma El -Ruby 22-4649
  # Args : comment_id
  # Return :
  # Explanation : 
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
