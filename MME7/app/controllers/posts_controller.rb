class PostsController < ApplicationController



  def delete
    @post = Post.find(params[:id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

    def list 
	@post = Post.all
    end

end
