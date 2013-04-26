<<<<<<< HEAD
class NotsController < ApplicationController
=======
﻿class NotsController < ApplicationController
 include ApplicationHelper
	
>>>>>>> notifications
 def index
    @count = notification_count(current_user.id)
 	@nots = NotificationUser.where("user_id = ? and created_at > ?", params[:user_id], Time.at(params[:after].to_i + 1)).order('created_at DESC')
 end

 def list
 	@notifications = NotificationUser.where("user_id = ? and created_at > ?", params[:userid], Time.at(params[:after2].to_i + 1)).order('created_at DESC')
 end

 def all
    @notifications = NotificationUser.where("user_id = ? ", current_user.id).order('created_at DESC')
    @notifications.each do |notification|
      notification.update_attributes(:read=>true)
    end
 end

 def read
    @notifications = NotificationUser.where("user_id = ? ", current_user.id).order('created_at DESC')
    @notifications.each do |notification|
      notification.update_attributes(:read=>true)
    end
    @count = notification_count(current_user.id)
 	respond_to do |format|
    format.js 
    end
 end

end
