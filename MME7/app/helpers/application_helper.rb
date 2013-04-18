#encoding: utf-8
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

end
