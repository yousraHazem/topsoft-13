class PostsController < ApplicationController


	 
  # Author : Salma El -Ruby 22-4649
  # Args : takes post_id 
  # Returns : redirects to page with posts available 
  # Explanation : this method deletes un wanted post
	  def delete
	    @post = Post.find(params[:id])
	  end
	  
	  def destroy
	    Post.find(params[:id]).destroy
	    redirect_to(:action => 'list')
	  end
 
  # Author : Salma El -Ruby 22-4649
  # Args : takes comment_id 
  # Returns : gets page with posts available 
  # Explanation : this method shows all comments
	    def list 
		@post = Post.all
	    end

		


end
