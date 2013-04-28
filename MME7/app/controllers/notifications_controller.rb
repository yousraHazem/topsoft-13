#encoding: UTF-8
class NotificationsController < ApplicationController
	 include ApplicationHelper
	
 def index
    #authorized by:sarah ahmed  id:22-1278
    #arguments none , returns list of  new notifications every 5 seconds
    #parameters none
    @count = notification_count(current_user.id)
 	@nots = NotificationUser.where("user_id = ? and created_at > ?", params[:user_id], Time.at(params[:after].to_i + 1)).order('created_at DESC')
 end

 def list
    #authorized by:sarah ahmed  id:22-1278
    #arguments none , returns list of  new notifications every 5 seconds 
    #parameters none
 	@notifications = NotificationUser.where("user_id = ? and created_at > ?", params[:userid], Time.at(params[:after2].to_i + 1)).order('created_at DESC')
 end

 def all
    #authorized by:sarah ahmed  id:22-1278
    #arguments none , returns all notifications for the current user make them as read
    #parameters none
    @notifications = NotificationUser.where("user_id = ? ", current_user.id).order('created_at DESC')
    @notifications.each do |notification|
      notification.update_attributes(:read=>true)
    end
 end

 def read
    #authorized by:sarah ahmed  id:22-1278
    #arguments none , returns all notifications for the current user and make them as read
    #parameters none
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
