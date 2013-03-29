class CommentsController < ApplicationController


  def delete
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

    def list 
  @comment = Comment.all
    end




end
