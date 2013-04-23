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


 def notification_count(current_user)
 @nots = NotUser.where("user_id = ? AND read = ? ", current_user , false).size
 end

  def notifications
    @nots = NotUser.where("user_id = ?", 1).order('created_at DESC')
  end

end
