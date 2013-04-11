class PostsController < ApplicationController



 #Author Riham Gamal 22-3871
 # create a new post
 def createPost
  @post = Post.new(params[:post])
  @post.user_id = 1
  if @post.save
   respond_to do |format|
    format.html{redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])}
    format.js
  end
  else
   redirect_to(:controller => 'groups',:action => 'show', :id =>params[:id])
  end

 end


 # Riham Gamal 22-3871, Mariam Ismail 22-3456
 # update the post by finding its id and changing the fields
 # takes the group-id and redirects back to show group

  respond_to :html, :json
 def updatePost
   @group_id = params[:group_id]
   @post = Post.find(params[:id])
      
      @post.update_attributes(params[:post])
   redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
 end




   def destroy
   @group_id = params[:group_id]
     Post.find(params[:id]).destroy
     redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
   end
  # Salma El Ruby 22-4649
  # displays all available posts 
     def list 
  @post = Post.all
     end 

end