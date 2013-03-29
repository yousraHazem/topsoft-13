class PostsController < ApplicationController


# Salma El Ruby 22-4649
# deletes posts
  def delete
    @post = Post.find(params[:id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to(:action => 'list')
  end

# Salma El Ruby 22-4649
# displays all available posts 
    def list 
	@post = Post.all
    end

end
