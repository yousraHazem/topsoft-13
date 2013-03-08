class CommentsController < ApplicationController
  
 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
  
   def edit
  @comment = Comment.find(params[:id])
end

  def update
   @post = Post.find(params[:post_id])
  @comment = Comment.find(params[:id])
  @comment.update_attributes(params[:comment])
  redirect_to @post
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
end


  #def edit
  #@comment = Comment.find(params[:id])
#end
  

  #http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy
 
  #def create
 #   @post = Post.find(params[:post_id])
#end