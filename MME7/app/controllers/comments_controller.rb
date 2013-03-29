class CommentsController < ApplicationController

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
