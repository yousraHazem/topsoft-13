#encoding: UTF-8
class CommentsController < ApplicationController

  # Author: Sama Akram
  # creates a new comment and redirect to group/project path
  # ARGS: comment.comment, comment.group_id or comment.project_id, comment.is_group,
  # comment.user_id, comment.username
  # returns newly created comment
  def createComment
    @position = params[:position].to_i
    @comment = Comment.new(params[:comment])
    @comment.save

    post_creator = Post.find(@comment.post_id).user_id
    creator_name = Post.find(@comment.post_id).user.name
    if current_user.id != post_creator
    notification = Notification.create(:content=>"#{current_user.name}  كام بالتعليق على تعبيرك" , :url =>"/posts/show/#{@comment.post_id}" , :image=>"post") 
    NotificationUser.create(:user_id=>post_creator , :notification_id=> notification.id)
    end   
    
    comment_notification = Notification.create(:content=>"#{current_user.name}  كام بالتعليق على تعبير #{creator_name}" , :url =>"/posts/show/#{@comment.post_id}" , :image=>"post") 
    @post = Post.find(@comment.post_id)
    @post.comments.each do |comment|
    if ((@comment.user_id != comment.user_id) && (comment.user_id != post_creator))
       sent_notifications = NotificationUser.find(:all , :conditions=>{:user_id=>comment.user_id , :notification_id=> comment_notification.id})
       if sent_notifications.empty?
       NotificationUser.create(:user_id=>comment.user_id , :notification_id=> comment_notification.id)
       end
    end
    end

    if (@comment.is_group == true)
        respond_to do |format|
          format.html {redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])}
          format.js
      end
    else

      if @position == 0
        respond_to do |format|
          format.html { redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id] , :p=>@position) }
          format.js
        end
      end
      if @position == 1
          respond_to do |format|
          format.html { redirect_to(:controller =>'posts' ,:action => 'show', :id =>@comment.post_id , :p=>@position)}
          format.js
        end
      end

    end
  end

  # Author: Sama Akram
  # updates the comment
  # ARGS the updated attributes
  # returns the updated comment
  respond_to :html, :json
  def updateComment
    @group_id = params[:group_id]
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    @comment.post_id = params[:post_id]
    respond_with @comment
  end
 
  
  # Author Sama Akram
  # deletes a comment
  # ARGS comment_id
  # returns nothing, deletes this comment record from db
  def destroyComment
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
     if (@comment.is_group == true)
        redirect_to(:controller => 'groups',:action => 'show', :id => params[:group_id])
      else
        redirect_to(:controller =>'projects' ,:action => 'show', :id => params[:project_id])
      end
  end
end