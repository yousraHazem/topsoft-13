module ApplicationHelper

  def error_messages_for(object)
    render(:partial=>'shared/error_messages', :locals=>{:object=> object})
  end

  def flash_message
  types = { :notice => 'success', :alert => 'error', :info => 'info' }
  flash.inject("") do |sum, message|
    content_tag :div, :class => "alert alert-#{types[message[0]]}" do
      button_tag('&#215;'.html_safe, :type => 'button', :class => 'close', :'data-dismiss' => 'alert', :name => nil) +
      message[1]
    end
    end
  end


#authorized by:sarah ahmed  id:22-1278
#arguments none , returns the count of the unread notifications of the current user
#parameters :current user id 
 def notification_count(current_user)
 @nots = NotificationUser.where("user_id = ? AND read = ? ", current_user , false).size
 end

 #authorized by:sarah ahmed  id:22-1278
 #arguments none , returns all notifications for the current user
 #parameters none
  def notifications
    @nots = NotificationUser.where("user_id = ?", current_user.id ).order('created_at DESC')
  end

end